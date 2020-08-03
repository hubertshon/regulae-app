class Api::CompletesController < ApplicationController

  def create
    complete = Complete.new(
      date: Date.today,
      habit_id: params[:habit_id]
    )
    complete.save
    render json: { habit_progress: complete.habit.habit_progress, completes: complete.habit.completes }
  end

  def delete
    complete = Complete.where(habit_id: params[:habit_id]).last
    if complete.destroy
      render json: { habit_progress: complete.habit.habit_progress, completes: complete.habit.completes }
    end
  end

  # def show
  #   complete = Complete.where(habit_id: params[:habit_id]).last
  #   render partial: 'complete.json.jb', locals: {complete: complete}
  # end

end
