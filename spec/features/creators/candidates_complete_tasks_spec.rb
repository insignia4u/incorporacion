require "spec_helper"

feature "Complete a task" do
  given(:candidate) { create(:candidate_with_company) }
  given(:task) { create(:task) }

  scenario "with valid data" do
    login_with(candidate)
    page.driver.post task_complete_path(task)

    expect( task.candidates.where(email:candidate.email) ).to exist
    expect( candidate.tasks.count ).to eql(1)
  end

end
