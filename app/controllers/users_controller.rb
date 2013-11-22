class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: "Signed up successfully."
    else
      render :new
    end
  end

  # http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"], except: [:index, :show]
  # http_basic_authenticate_with name: CONFIG[:username], password: CONFIG[:password], except: [:index, :show]
end
