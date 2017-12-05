require "rails_helper"

RSpec.feature "Users can create new tasks" do
    before do
        visit "/"

        click_link "New Taskeriño"
    end
    scenario "with valid attributes" do
        task_name = "Clean the bathroom"
        fill_in "This the new task!", with: task_name
        fill_in "Due at...", with: "2017-12-01 17:00:00"
        click_button "Create Task"

        expect(page).to have_content "Wooo! New Task!!!!"
        
        title =  + "Task - " + task_name
        expect(page).to have_title title

        task = Task.find_by(name: task_name)
        expect(page.current_url).to eq task_url(task)
    end

    scenario "when providing invalid attributes" do
        click_button "Create Task"

        expect(page).to have_content "Task creation failed"
        expect(page).to have_content "Name can't be blank"
    end
end