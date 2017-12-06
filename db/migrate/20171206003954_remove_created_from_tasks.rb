class RemoveCreatedFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :created, :date
  end
end
