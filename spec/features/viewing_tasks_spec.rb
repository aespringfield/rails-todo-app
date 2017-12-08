require "rails_helper"

RSpec.feature "Users can view tasks" do
    scenario "with the task details" do
        task = FactoryBot.create(:task, name: "Empty dishwasher")

        visit "/"
        click_link "Empty dishwasher"
        expect(page.current_url).to eq task_url(task)
    end

    scenario "in the incomplete category when they are incomplete" do
        task_name = "Make breakfast"
        task = FactoryBot.create(:task, name: task_name)

        visit "/"
        within("#task-#{task.id}") do
            click_link "Mark as complete"
        end

        within (".incomplete-task-list") do
            expect(page).to_not have_content task_name
        end
    end
end