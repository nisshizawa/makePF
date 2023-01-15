# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_status, only: [:create]
  
  def after_sign_in_path_for(resource)
    search_path
  end
    
  def after_sign_out_path_for(resource)
    user_homes_top_path
  end
  
  def new_guest
    user = User.guest
    sign_in user
    redirect_to items_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number])
  end
  
  def user_status
    @user = User.find_by(email: params[:user][:email])
    return if !@user
     if @user.valid_password?(params[:user][:password]) && !@user.is_active 
       redirect_to new_user_registration_path
     end  
  end  
end
