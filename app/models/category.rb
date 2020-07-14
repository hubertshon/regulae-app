class Category < ApplicationRecord

  validates :name, presence: true


  has_many :habits
  belongs_to :user

  # def habit_names
  #   category.habits.map { |habit| habits.["name"] } 
  # end



end
