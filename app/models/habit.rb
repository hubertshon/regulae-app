class Habit < ApplicationRecord

  validates :name, presence: true
  
  belongs_to :user
  belongs_to :category
  has_many :completes

  
  def total
    return factor * frequency * duration
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
    complete = Complete.where({ habit_id: current_user.id }).last 
    complete.destroy
  end


end
