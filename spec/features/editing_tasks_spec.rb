require "rails_helper"

RSpec.feature "Users can edit existing tasks" do
    scenario "with valid attributes" do
        old_task_name = "Stew greens"
        new_task_name = "Stew Y Paul"
        FactoryBot.create(:task, name: old_task_name)

        visit "/"
        click_link old_task_name
        click_link "Edit Task"
        fill_in "This the new task!", with: new_task_name
        click_button "Update Task"

        expect(page).to have_content "Yeahhhh look at that fresh and squeaky updated task!"
        expect(page).to have_content new_task_name
    end
end