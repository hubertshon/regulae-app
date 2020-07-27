class Api::CompletesController < ApplicationController

  def create
    complete = Complete.new(
      date: Date.today,
      habit_id: params[:habit_id]
    )
    complete.save
  end

  def delete
    complete = Complete.where(habit_id: id).last
    complete.destroy
  end

end
