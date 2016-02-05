class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: 200, json: {
        message: "Successfully created user.",
        user: user
      }.to_json
    else
      render status: 422, json: {
        errors: user.errors
      }.to_json
    end
  end

  def new
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render status: 200, json: {
        message: "Successfully updated user.",
        user: user
      }.to_json
    else
      render status: 422, json: {
        message: "User couldn't be updated."
      }.to_json
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
render status: 200, json: {
      message: "Successfully deleted user."
    }.to_json
  end

  private
  def user_params
    params.permit("username", "password", "timezone", "contacts")
  end
end
