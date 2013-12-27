require "spec_helper"

feature "New Candidate" do
  given(:attrs) { build(:candidate) }
  given(:user) { create(:user) }

  scenario "with valid data" do
    login_with(user)
    visit '/candidates/new'

    fill_in 'candidate[first_name]',    with: attrs[:first_name]
    fill_in 'candidate[last_name]',     with: attrs[:last_name]
    fill_in 'candidate[email]',         with: attrs[:email]

    find_button('Create').click

    expect( Candidate.where(email: attrs[:email],
                            company: user.company) ).to exist
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
end