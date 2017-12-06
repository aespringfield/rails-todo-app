class UpdateCompleteDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :tasks, :complete, default=false
  end
end
