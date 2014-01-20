require "spec_helper"

feature "Display my training programs" do
  given(:candidate) { create(:candidate_with_company) }
  given(:program) { create(:training_program_with_tasks_saved) }

  background do
    candidate.training_programs << program
  end

  scenario "when it is visited" do
    login_with(candidate)
    visit my_training_programs_path

    expect(page).to have_content program.name
  end

end
