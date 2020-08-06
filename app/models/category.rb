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


# NEW Progress for current month
  def category_progress
    current_completes = 0
    current_total = []
    if habits.length > 0
      habits.map do |habit|
        habit.completes.map do |complete|
          if (Date.today - complete.date).to_i < 28
            current_completes += 1
          end
        end
        current_total << habit.factor * habit.frequency
      end
    end
    if current_total.sum > 0
      progress = current_completes/(current_total.sum.to_f)
      progress = progress.round(2)
    end
    if progress.to_i > 100
      progress = 100
    end
    return progress
  end


  # ORIGINAL progress for all (Hard Mode)
  # def hard_progress
  #   if habits.length > 0
  #     all_habit = habits.map { |habit| habit.habit_progress }
  #     progress = (all_habit.sum / habits.length).round(2)
  #   end
  #   if progress > 100
  #     progress = 100
  #   end
  #   return progress
  # end



end
