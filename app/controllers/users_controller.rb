class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Elvents!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @attended_events = @user.attended_events.all
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.prev_events
  end

  private

    def user_params
      params.require(:user).permit(:username)
    end

end
