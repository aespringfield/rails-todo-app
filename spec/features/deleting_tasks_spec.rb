require "rails_helper"

RSpec.feature "Users can delete existing tasks" do
    scenario "successfully" do
        task_name = "Consume Y Paul stew"
        FactoryBot.create(:task, name: task_name)

        visit "/"
        click_link task_name
        click_link "Kill This Fool"
        expect(page).to have_content "Well that's the last you'll see of them, you monster."
    end
end