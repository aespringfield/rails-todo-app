class ChangeFormatOfDue < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :due, :date
  end
end
