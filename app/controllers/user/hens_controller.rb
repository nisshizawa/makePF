class User::HensController < ApplicationController
   before_action :guest_check
   
  def guest_check
      if current_user == User.find(5)
        redirect_to user_homes_top_path,notice: "このページを見るには会員登録が必要です。"
      end
  end        
   
  def new
    @hen = Hen.new    
  end
  
  def create
    @hen = Hen.new(hen_params)
    @hen.user_id = current_user.id
    if @hen.save
      flash[:notice] ='You have created hen successfully.'
      redirect_to hen_path(@hen.id)
    else
      @hens = Hen.all
      render :index
    end  
  end    

  def index
    @hens = current_user.hens.all
  end

  def show
    @hen = Hen.find(params[:id])
  end
  
  def edit
    @hen = Hen.find(params[:id])
  end
  
  def update
    @hen = Hen.find(params[:id])
    if @hen.update(hen_params)
      flash[:notice] ='You have update hen successfully.'
      redirect_to hen_path(@hen.id)
    else
      render :edit
    end  
  end
  
  def destroy
    @hen = Hen.find(params[:id])
    @hen.destroy
    redirect_to hen_path    
  end
  
  private
  def hen_params
    params.require(:hen).permit(:user_id, :animal_name, :comment, :vaccine, :arrival, :amount, :is_active, :image)
  end
end
