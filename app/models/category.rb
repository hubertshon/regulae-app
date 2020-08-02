class Category < ApplicationRecord
require 'date'
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



  # def category_progress
  #   current_completes = []
  #   current_total = []
  #   if habits.length > 0
  #     habits.map do |habit|
  #       habit.completes do |complete|
  #         if Date.today - complete.date > 28
  #           current_completes << complete
  #         end
  #       end
  #       current_total << habit.factor * habit.frequency
  #     end
  #   end
  #   return current_completes.length / current_total.sum
  # end


  #ORIGINAL
  def category_progress
    if habits.length > 0
      all_habit = habits.map { |habit| habit.habit_progress }
      (all_habit.sum / habits.length).round(2)
    end
  end



end
