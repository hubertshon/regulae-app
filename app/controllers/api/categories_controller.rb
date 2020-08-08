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
    if params[:image_url]
      response = Cloudinary::Uploader.upload(params[:image_file])
      cloudinary_url = response["secure_url"]
    end
    @category = Category.new(
      name: params[:name],
      statement: params[:statement],
      image_url: cloudinary_url,
      user_id: current_user.id,
      color: params[:color]
    )
    if @category.save
      render "show.json.jb"
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if params[:image_file]
      response = Cloudinary::Uploader.upload(params[:image_file])
      cloudinary_url = response["secure_url"]
    end
    @category = Category.find(params[:id]) 

      @category.name = params[:name] || @category.name
      @category.statement = params[:statement] || @category.statement
      @category.image_url = cloudinary_url || @category.image_url
      @category.user_id = params[:user_id] || @category.user_id
      @category.color = params[:color] || @category.color
      if @category.save
        render "show.json.jb"
      else
        render json: { errors: @category.errors.full_messages },
        status: :unprocessable_entity
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
