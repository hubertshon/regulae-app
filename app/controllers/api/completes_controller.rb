class Api::CompletesController < ApplicationController

  def create
    complete = Complete.new(
      date: Date.today,
      habit_id: params[:habit_id]
    )
    complete.save
  end

  def delete
    complete = Complete.where(habit_id: params[:habit_id]).last
    if complete.destroy
      render json: { message: "Habit Deleted" }
    end
  end

  # def show
  #   complete = Complete.where(habit_id: params[:habit_id]).last
  #   render partial: 'complete.json.jb', locals: {complete: complete}
  # end

end
