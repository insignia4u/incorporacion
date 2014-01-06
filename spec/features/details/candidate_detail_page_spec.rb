require "spec_helper"

feature "Candidate detail" do
  given(:user) { create(:user) }
  given(:candidate) { create(:candidate, company:user.company) }
  given(:action_category) { create(:action_category, company:user.company) }
  given!(:actions) { create_list(:candidate_action, 5, user:user, candidate:candidate, action_category:action_category) }

  scenario "with unauthorized access" do
    visit "/candidates/#{candidate.id}"
    expect(current_path).to eql new_user_session_path
  end

  scenario "when it is visited" do
    login_with(user)
    visit "/candidates/#{candidate.id}"

    expect(page).to have_content candidate.first_name
    expect(page).to have_content candidate.last_name
    expect(page).to have_content candidate.email

    find_link("Candidate's CV").visible?

    actions.each do |action|
      expect(page).to have_content action.description
    end
  end

end
