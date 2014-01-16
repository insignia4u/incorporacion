require "spec_helper"

feature "A Candidate complete a training program" do
  given(:user) { create(:user) }
  given(:company) { user.company }
  given(:program) { create(:training_program_with_tasks_saved) }
  given(:candidate) { create(:candidate, company:user.company) }

  background do
    candidate.training_programs << program
    candidate.tasks << program.tasks.take(program.tasks.count - 1)
    login_with(candidate)
    page.driver.post task_complete_path(program.tasks.last)
    open_email(candidate.email)
  end

  scenario "sending completation email" do
    expect( current_email ).to have_content candidate.full_name
    expect( current_email ).to have_content program.name
  end

end
