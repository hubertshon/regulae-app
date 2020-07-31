class Category < ApplicationRecord

  validates :name, presence: true
  validates :user_id, presence: true


  has_many :habits

  belongs_to :user

  def habit_names
    habits.map { |habit| habit["name"] }
  end

  def habit_ids
    habits.map { |habit| habit["id"] }
  end


  def category_progress
    if habits.length > 0
      all_habit = habits.map { |habit| habit.habit_progress }
      (all_habit.sum / habits.length).round(2)
    end
  end



end
