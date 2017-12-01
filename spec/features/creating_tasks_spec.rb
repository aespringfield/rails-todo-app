require "rails_helper"

RSpec.feature "Users can create new tasks" do
    scenario "with valid attributes" do
        visit "/"

        click_link "New Taskeriño"

        fill_in "Name", with: "Clean the bathroom"
        fill_in "Due", with: "2017-12-01 17:00:00"
        click_button "Create Taskeriño"

        expect(page).to have_content "Task has been created."
    end
end