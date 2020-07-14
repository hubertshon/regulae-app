class Api::CategoriesController < ApplicationController

  before_action :authenticate_user

  def index
    @categories = Category.where(user_id: current_user.id) 
    render 'index.json.jb'
  end

  def show
    @category = Category.find(params[:id])
    if @category.user_id == current_user.id
      render 'show.json.jb'
    else
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

  def create
    @category = Category.new(
      name: params[:name],
      statement: params[:statement],
      image_url: params[:image_url],
      user_id: current_user.id
    )
    if @category.save
      render "show.json.jb"
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @category = Category.find(params[:id]) 
    if @category.user_id == current_user.id
      @category.name = params[:name] || @category.name
      @category.statement = params[:statement] || @category.statement
      @category.image_url = params[:image_url] || @category.image_url
      @category.user_id = params[:user_id] || @category.user_id
      if @category.save
        render "show.json.jb"
      else
        render json: { errors: @category.errors.full_messages },
        status: :unprocessable_entity
      end
    else
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.user_id == current_user.id
      @category.destroy
      render json: { message: "Category Deleted" }
    else
      render json: { message: "Not Authorized"}, status: :unauthorized
    end
  end

end
