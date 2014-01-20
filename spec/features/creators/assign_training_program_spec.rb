require "spec_helper"

feature "Assign a Training Program" do
  given(:user) { create(:user) }
  given(:company) { user.company }
  given!(:candidates) { create_list(:candidate, 10, company:company) }
  given(:program) { create(:training_program, company:company) }
  given(:candidate) { create(:candidate, company:company) }

  background do
    login_with(user)
    visit new_training_program_assign_path(program)
  end

  scenario "with valid data" do
    select candidates.first.full_name, from:'training_candidate[candidate_id]'
    find_button('Assign').click

    expect(program.candidates.where(email:candidates.first.email)).to exist
    expect(current_path).to eql training_programs_path
  end

  scenario "should not display a candidate with the same program assigned" do
    candidate.training_programs << program
    expect(page).not_to have_content candidate.full_name
  end

  scenario "with invalida data" do
    select candidates.first.full_name, from:'training_candidate[candidate_id]'
    candidates.first.training_programs << program
    find_button('Assign').click

    expect( candidates.first.training_programs.count ).to eql(1)
    expect(page).to have_content 'Candidate should assigned one time'
  end

end
