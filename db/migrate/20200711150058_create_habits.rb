class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.text :notes
      t.integer :frequency
      t.integer :factor
      t.integer :duration
      t.string :user_id
      t.string :integer
      t.integer :category_id
      t.date :complete_by

      t.timestamps
    end
  end
end
