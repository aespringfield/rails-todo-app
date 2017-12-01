class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :complete
      t.date :created
      t.datetime :due

      t.timestamps
    end
  end
end
