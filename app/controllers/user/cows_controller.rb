class User::CowsController < ApplicationController
   before_action :guest_check
   
  def new
    @cow = Cow.new    
  end
  
  def create
    @cow = Cow.new(cow_params)
    @cow.user_id = current_user.id
    if @cow.save
      flash[:notice] ='You have created cow successfully.'
      redirect_to cow_path(@cow.id)
    else
      @cows = Cow.all
      render :index
    end  
  end    

  def index
    @cows = current_user.cows.all
  end

  def show
    @cow = Cow.find(params[:id])
  end
  
  def edit
    @cow = Cow.find(params[:id])
  end
  
  def update
    @cow = Cow.find(params[:id])
    if @cow.update(cow_params)
      flash[:notice] ='You have update cow successfully.'
      redirect_to cow_path(@cow.id)
    else
      render :edit
    end  
  end
  
  def destroy
    @cow = Cow.find(params[:id])
    @cow.destroy
    redirect_to cows_path    
  end
  
  private
  def cow_params
    params.require(:cow).permit(:user_id, :image, :name, :animal_name, :comment, :vaccine, :arrival, :estimated, :mating, :number, :is_active)
  end
end
