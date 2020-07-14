class CreateCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :completes do |t|
      t.date :date
      t.integer :habit_id

      t.timestamps
    end
  end
end
