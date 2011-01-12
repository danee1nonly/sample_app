class UsersController < ApplicationController
  def new
    @title = "sign up"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = 'welcome to fake twitter!'
      redirect_to @user
    else
      @title = "sign up"
      render 'new'  
      
    end
  end

end
