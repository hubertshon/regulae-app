class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: :create

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
     render "show.json.jb"
    else
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.id == current_user.id
      @user = current_user
      @user.first_name = params[:first_name] || @user.first_name
      @user.last_name = params[:last_name] || @user.last_name
      @user.email = params[:email] || @user.email
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
      if @user.save 
        render 'show.json.jb' 
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "Not Authorized" }, status: :unauthorized
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      render json: { message: "Account Deleted" }, status: :ok
    else
      render json: { message: "Not Authorized" }
    end
  end

end

