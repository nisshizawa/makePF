class User::ManagementsController < ApplicationController
  def new
    @management = Management.new
  end
  
  def create
    @management = Management.new(management_params)
    @management.save
    redirect_to user_management_path(@management.id)
  end
  
  def check
    @management = Management.find(params[:id])
  end

  def show
    @management = Management.find(params[:id])
  end

  def edit
    @management = Management.find(params[:id])
  end
  
  def update
    @management = Management.find(params[:id])
    @management.update(management_params)
    redirect_to user_management_path(@management.id)
  end

  def index
    @managements = Management.all
    @management = Management.new
  end
  
  private
  def management_params
    params.require(:management).permit(:name, :animal_name, :comment, :price, :amount, 
          :vaccine, :arrival, :estimated, :mating, :number, :is_active)
  end
end
