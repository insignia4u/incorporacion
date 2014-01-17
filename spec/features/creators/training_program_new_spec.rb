require "spec_helper"

feature "New Training Program" do
  given(:user) { create(:user) }
  given(:company) { user.company }
  given(:program) { build(:training_program) }
  given(:tasks) { build_list(:task, 3) }

  scenario "with valid data" do
    login_with(user)
    visit '/training_programs/new'

    fill_in 'training_program[name]',   with: program[:name]
    tasks.each_with_index do |task,index|
      fill_in "training_program[tasks_attributes][#{index}][title]",        with: task.title
      fill_in "training_program[tasks_attributes][#{index}][description]",  with: task.description
    end

    find_button('Create').click

    new_programs = company.training_programs.where(name: program[:name])
    expect( new_programs ).to exist
    expect( new_programs.first.tasks.count ).to eql 3
    expect(current_path).to eql '/training_programs'
  end

  scenario "with invalid data" do
    login_with(user)
    visit '/training_programs/new'

    find_button('Create').click

    expect(page).to have_content "Name can't be blank"
  end

  scenario "with an unsigned in user" do
    visit '/training_programs/new'
    expect(current_path).to eql new_user_session_path
  end

  scenario "with an unadmin in user" do
    user.admin = false
    user.save
    login_with(user)
    visit '/training_programs/new'
    expect(current_path).to eql root_path
  end

end
