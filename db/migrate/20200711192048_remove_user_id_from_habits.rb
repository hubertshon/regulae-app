class RemoveUserIdFromHabits < ActiveRecord::Migration[6.0]
  def change
    remove_column :habits, :user_id, :sring
    add_column :habits, :user_id, :integer
  end
end
