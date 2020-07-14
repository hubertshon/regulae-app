class Api::HabitsController < ApplicationController

  before_action :authenticate_user

  def show
    @habit = Habit.find(params[:id])
    if @habit.user_id == current_user.id
      render 'show.json.jb'
    else 
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

  def create
    @habit = Habit.new(
      name: params[:name],
      notes: params[:notes],
      frequency: params[:frequency],
      factor: params[:factor],
      duration: params[:duration],
      user_id: current_user.id,
      category_id: params[:category_id],
      complete_by: params[:complete_by]
    )
    if @habit.save
      render "show.json.jb"
    else
      render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @habit = Habit.find(params[:id])
    if @habit.user_id == current_user.id
      @habit.name = params[:name] || @habit.name
      @habit.notes = params[:notes] || @habit.notes
      @habit.frequency = params[:frequency] || @habit.frequency
      @habit.factor = params[:factor] || @habit.factor
      @habit.duration = params[:duration]  || @habit.duration
      @habit.user_id = current_user.id
      @habit.category_id = params[:category_id] || @habit.category_id
      @habit.complete_by = params[:complete_by] || @habit.complete_by
      if @habit.save
        render "show.json.jb"
      else
        render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    if @habit.user_id == current_user.id
      @habit.destroy
      render json: { message: "Habit Deleted" }
    else
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

end
