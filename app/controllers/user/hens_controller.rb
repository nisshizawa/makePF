class User::HensController < ApplicationController
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
    params.require(:hen).permit(:user_id, :animal_name, :comment, :vaccine, :arrival, :amount, :is_active)
  end
end
