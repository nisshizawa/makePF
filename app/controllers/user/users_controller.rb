class User::UsersController < ApplicationController
  def confirm
    @user = current_user    
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to show_path
  end
    
  def withdrawal
    current_user.update(is_active: false)
    reset_session
    redirect_to  user_homes_top_path
  end
    
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
        
end
