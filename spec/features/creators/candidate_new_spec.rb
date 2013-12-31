require "spec_helper"

feature "New Candidate" do
  given(:candidate) { build(:candidate) }
  given(:user) { create(:user) }
  given(:company) { user.company }

  scenario "with valid data" do
    login_with(user)
    visit '/candidates/new'

    fill_in 'candidate[first_name]',    with: candidate[:first_name]
    fill_in 'candidate[last_name]',     with: candidate[:last_name]
    fill_in 'candidate[email]',         with: candidate[:email]

    find_button('Create').click

    expect( company.candidates.where(email: candidate[:email]) ).to exist
    expect(current_path).to eql '/candidates'

  end

  scenario "with invalid data" do
    login_with(user)
    visit '/candidates/new'

    find_button('Create').click

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Email can't be blank"

  end

  scenario "with an unsigned in user" do
    visit '/candidates/new'
    expect(current_path).to eql new_user_session_path

  end

end
