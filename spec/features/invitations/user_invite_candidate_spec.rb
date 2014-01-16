require "spec_helper"

feature "Invite Candidate" do
  given(:user) { create(:user) }
  given(:company) { user.company }
  given(:candidate) { create(:candidate, company:user.company) }

  background do
    login_with(user)
    visit "/candidates/#{candidate.id}/edit"
    find_link('Invite').click
    open_email(candidate.email)
  end

  scenario 'with correct content' do
    expect(current_email).to have_content candidate.email
  end

  scenario "sending invitations" do
    current_email.click_link 'Accept invitation'

    expect(page).to have_content 'Set your password'

    fill_in 'candidate[password]',              with: 123123123
    fill_in 'candidate[password_confirmation]', with: 123123123

    find_button('Set my password').click

    object = company.candidates.where(email:candidate.email).last
    expect(object.confirmed?).to be_true
    expect(object.encrypted_password?).to be_true
    expect(page).to have_content 'Your password was set successfully. You are now signed in.'
  end

end
