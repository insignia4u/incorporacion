require "spec_helper"

feature "Complete a task" do
  given(:candidate) { create(:candidate_with_company) }
  given(:task) { create(:task) }

  scenario "with valid data" do
    login_with(candidate)
    post "tasks/#{task.id}/complete"

    expect(task.candidates.where(id:candidate.id)).to exist
  end

end
