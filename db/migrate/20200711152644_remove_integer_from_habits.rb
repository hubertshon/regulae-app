class RemoveIntegerFromHabits < ActiveRecord::Migration[6.0]
  def change
    remove_column :habits, :integer, :string
  end
end
