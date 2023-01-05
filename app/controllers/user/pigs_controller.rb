class User::PigsController < ApplicationController
  def new
    @pig = Pig.new    
  end
  
  def create
    @pig = Pig.new(pig_params)
    @pig.user_id = current_user.id
    if @pig.save
      flash[:notice] ='You have created pig successfully.'
      redirect_to cow_path(@pig.id)
    else
      @pig = Pig.all
      render :index
    end  
  end    

  def index
    @pigs = current_user.pigs.all
  end

  def show
    @pig = Pig.find(params[:id])
  end
  
  def edit
    @pig = Pig.find(params[:id])
  end
  
  def update
    @pig = Pig.find(params[:id])
    if @pig.update(pig_params)
      flash[:notice] ='You have update pig successfully.'
      redirect_to pig_path(@pig.id)
    else
      render :edit
    end  
  end
  
  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to pig_path    
  end
  
  private
  def pig_params
    params.require(:pig).permit(:user_id, :name, :animal_name, :comment, :vaccine, :arrival, :estimated, :mating, :number, :is_active)
  end
end
