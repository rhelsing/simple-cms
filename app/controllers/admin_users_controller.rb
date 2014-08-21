class AdminUsersController < ApplicationController

	layout "admin"
	before_action :confirm_logged_in

  def index
  	@users = AdminUser.sorted
  end

  def new
  	@user = AdminUser.new
  end

  def create
  	@user = AdminUser.new(user_params)
  	if @user.save
  		flash[:notice] = "User created successfully"
      redirect_to(:action => 'index')
    else
      #redisplay form, validation
      render('new')
  	end
  end

  def edit
  	@user = AdminUser.find(params[:id])
  end

  def update
  	@user = AdminUser.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:notice] = "User updated successfully"
      redirect_to(:action => 'index')
    else
      #redisplay form, validation
      render('edit')
  	end
  end

  def delete
  	#are you sure?
  end

  def destroy
  	user = AdminUser.find(params[:id]).destroy
    flash[:notice] = "User '#{user.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end
