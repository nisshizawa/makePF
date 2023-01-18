class User::PigsController < ApplicationController
   before_action :authenticate_user!  
   
   before_action :guest_check
   
  def guest_check
      if current_user.email=='guest@example.com'
        redirect_to user_homes_top_path,notice: "このページを見るには会員登録が必要です。"
      end
  end        
   
  def new
    @pig = Pig.new    
  end
  
  def create
    @pig = Pig.new(pig_params)
    @pig.user_id = current_user.id
    if @pig.save
      flash[:notice] ='豚の情報を登録しました！'
      redirect_to pig_path(@pig.id)
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
      flash[:notice] ='豚の情報を更新しました！'
      redirect_to pig_path(@pig.id)
    else
      render :edit
    end  
  end
  
  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to pigs_path    
  end
  
  private
  def pig_params
    params.require(:pig).permit(:user_id, :name, :animal_name, :comment, :vaccine, :arrival, :estimated, :mating, :number, :is_active, :image)
  end
end
