class Habit < ApplicationRecord

  validates :name, presence: true
  
  belongs_to :user
  belongs_to :category
  has_many :completes


  # **below methods are untested**
  def total
    return factor * frequency * duration
  end

  # def add_complete(habit_id.to_i)
  #   complete = Complete.new(
  #     date: Date.today,
  #     habit_id: habit_id
  #   )
  # end

  # def remove_complete
  #   @complete = Complete.last.where(habit_id: current_user.id)
  # end

  # def habit_progress
  #   return (completes.count / total).to_f
  # end

  
  
  
end
