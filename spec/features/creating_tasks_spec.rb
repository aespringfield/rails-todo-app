require "rails_helper"

RSpec.feature "Users can create new tasks" do
    before do
        visit "/"

        click_link "New Taskeriño"
    end
    scenario "with valid attributes" do
        task_name = "Clean the bathroom"
        fill_in "This the new task!", with: task_name
        fill_in "Due at...", with: "2017-12-01"
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

    scenario "with an attachment" do
        fill_in "This the new task!", with: "Write thank-you to grandma"
        fill_in "Due at...", with: "2017-12-27"
        attach_file "File", "spec/fixtures/thank-you-template.txt"
        click_button "Create Task"

        expect(page).to have_content "Wooo! New Task!!!!"
        
        within(".attachment") do
            expect(page).to have_content "thank-you-template.txt"
        end
    end
end