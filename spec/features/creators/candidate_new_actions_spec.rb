require "spec_helper"

feature "Candidate actions" do
  given(:user) { create(:user) }
  given(:company) { user.company }
  given(:candidate) { create(:candidate, company: company) }
  given(:action_category) { build(:action_category, company: company) }
  given(:action) { build(:candidate_action, action_category: action_category) }

  scenario "with unauthorized access" do
    visit "/candidates/#{candidate.id}/actions/new"
    expect(current_path).to eql new_user_session_path
  end

  scenario "with valid data and an unexistent action category" do
    login_with(user)
    visit candidate_path(candidate)

    click_link('Register a new action')
    expect(current_path).to eql "/candidates/#{candidate.id}/actions/new"

    fill_in 'candidate_action_service[category_name]', with: action_category.name
    fill_in 'candidate_action_service[description]', with: action.description
    find_button('Register').click


    expect(CandidateAction.all).not_to be_empty
    expect(ActionCategory.all).not_to be_empty

    expect(ActionCategory.where(name: action_category.name)).to exist
    expect(company.action_categories.where(name: action_category.name)).to exist

    category = ActionCategory.where(name: action_category.name).first
    expect(category.candidate_actions.
                    where(description: action.description)).to exist

    expect(candidate.candidate_actions.
                     where(description: action.description)).to exist

    expect(user.candidate_actions.
                where(description: action.description)).to exist
  end

  scenario "with valid data and an existent action category" do
    action_category.save
    action.user = user
    action.action_category = action_category
    action.candidate = candidate
    action.save

    login_with(user)
    visit candidate_path(candidate)

    click_link('Register a new action')
    expect(current_path).to eql "/candidates/#{candidate.id}/actions/new"

    fill_in 'candidate_action_service[category_name]', with: action_category.name
    fill_in 'candidate_action_service[description]', with: action.description
    find_button('Register').click

    expect(ActionCategory.where(name: action_category.name).count).to eql 1
  end

  scenario "with invalid data" do
    login_with(user)
    visit candidate_path(candidate)

    click_link('Register a new action')
    expect(current_path).to eql "/candidates/#{candidate.id}/actions/new"

    find_button('Register').click

    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Category name can't be blank"
  end
end
