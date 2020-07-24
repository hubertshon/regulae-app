class Habit < ApplicationRecord

  validates :name, presence: true
  validates :frequency, presence: true, numericality: { greater_than: 0 }
  validates :factor, presence: true, numericality: { greater_than: 0}
  validates :category_id, presence: true, numericality: true
  
  belongs_to :user
  belongs_to :category
  has_many :completes

  
  def total
    if complete_by
      if factor == 28
        pre_total = (complete_by - created_at.to_date + 1).to_i
      elsif factor == 4
        pre_total = complete_by.downto(created_at.to_date).count.fdiv(7).round
      elsif factor == 1 
        pre_total = complete_by.downto(created_at.to_date).count.fdiv(28).round
      end
      pre_total
    elsif duration
      factor * frequency * duration
    end
  end

  def remove_date
    habit = Habit.find(id)
    habit.complete_by = nil 
    habit.save
  end

  def add_complete
    complete = Complete.new(
      date: Date.today,
      habit_id: id
    )
    complete.save
  end

  def habit_progress
    ((completes.length.to_d / total.to_i).to_f).round(2)
  end

  def remove_complete
    complete = Complete.where(habit_id: id).last
    complete.destroy
  end



end
