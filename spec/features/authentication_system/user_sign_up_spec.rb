require "spec_helper"

feature "User sign up" do
  given(:attrs) {
    {
      company:   "Stark Inc",
      full_name: "Tony Stark",
      email:     "tony@starkinc.com",
      password:  "123123123"
    }
  }

  scenario "with valid data" do
    visit '/signup'

    fill_in 'user[company_attributes][name]', with: attrs[:company]
    fill_in 'user[full_name]',                with: attrs[:full_name]
    fill_in 'user[email]',                    with: attrs[:email]
    fill_in 'user[password]',                 with: attrs[:password]
    fill_in 'user[password_confirmation]',    with: attrs[:password]

    find_button("Sign up").click

    expect(Company.where(name: attrs[:company])).to exist
    expect(User.where(email: attrs[:email])).to exist
    expect(User.last.company).to eql(Company.last)
    expect(current_path).to eql('/')
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "with invalid data" do
    visit '/signup'

    find_button("Sign up").click

    expect(Company.all).to be_empty
    expect(User.all).to be_empty
    expect(page).to have_content("Company name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Full name can't be blank")
  end
end

