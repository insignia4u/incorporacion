require "spec_helper"

feature "Invite User" do
  given(:user) { create(:user) }
  given(:attrs) {
    { email:'test@test.com', full_name:'Test Name' }
  }

  background do
    login_with(user)
    visit new_user_invitation_path
    fill_in 'user[email]', with: attrs[:email]
    fill_in 'user[full_name]', with: attrs[:full_name]
    find_button('Send an invitation').click
    open_email(attrs[:email])
  end

  scenario "sending invitations" do
    current_email.click_link 'Accept invitation'

    expect(page).to have_content 'Set your password'

    fill_in 'user[password]',              with: 123123123
    fill_in 'user[password_confirmation]', with: 123123123

    find_button('Set my password').click

    new_user = user.company.users.where(email:attrs[:email])
    expect( new_user ).to exist
    expect( new_user.first.confirmed? ).to be_true
    expect( new_user.first.encrypted_password? ).to be_true
    expect( new_user.first.full_name ).to eql(attrs[:full_name])
    expect(page).to have_content 'Your password was set successfully. You are now signed in.'
  end

end
