require "spec_helper"

feature "A Candidate complete a training program" do
  given(:user) { create(:user) }
  given(:company) { user.company }
  given(:program) { create(:training_program_with_tasks_saved) }
  given(:another_program) { create(:training_program_with_tasks_saved) }
  given(:candidate) { create(:candidate, company:user.company) }

  background do
    login_with(candidate)
    candidate.training_programs << program
    candidate.training_programs << another_program
    candidate.tasks << program.tasks.take(program.tasks.count - 1)
  end

  scenario "sending completation email" do
    page.driver.post task_complete_path(program.tasks.last)
    open_email(candidate.email)
    expect( current_email ).to have_content candidate.full_name
    expect( current_email ).to have_content program.name
  end

  scenario "sending completation email with another program completed" do
    candidate.tasks << another_program.tasks.take(another_program.tasks.count - 1)
    page.driver.post task_complete_path(another_program.tasks.last)
    open_email(candidate.email)
    expect( current_email ).to have_content candidate.full_name
    expect( current_email ).to have_content another_program.name
  end

end
