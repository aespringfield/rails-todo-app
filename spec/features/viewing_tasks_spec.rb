require "rails_helper"

RSpec.feature "Users can view tasks" do
    scenario "with the task details" do
        task = FactoryBot.create(:task, name: "Empty dishwasher")

        visit "/"
        click_link "Empty dishwasher"
        expect(page.current_url).to eq task_url(task)
    end
end