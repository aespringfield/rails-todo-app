require "rails_helper"

RSpec.feature "Users can create new tasks" do
    scenario "with valid attributes" do
        visit "/"

        click_link "New Taskeriño"

        fill_in "This the new task!", with: "Clean the bathroom"
        fill_in "Due at...", with: "2017-12-01 17:00:00"
        click_button "Create Task"

        expect(page).to have_content "Task has been created."
    end
end