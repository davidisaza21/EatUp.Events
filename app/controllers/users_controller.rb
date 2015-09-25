class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def user_params
		params.require(:user).permit(:email, :location, :created_at, :updated_at)
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
# If save succeeds, redirect to the list action
			flash[:success] = "user was created successfully"
		else
# If save fails, redisplay the form so user can fix problems
			redirect_to root_path
		end
	end
end
