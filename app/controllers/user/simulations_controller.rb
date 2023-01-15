class User::SimulationsController < ApplicationController
     before_action :authenticate_user!

     before_action :guest_check
     
    def guest_check
        if current_user.email=='guest@example.com'
          redirect_to user_homes_top_path,notice: "このページを見るには会員登録が必要です。"
        end
    end     
     
    def index
        @simulations = current_user.simulations.all
        @all_price = @simulations.inject(0) { |sum, item| sum + item.sum_of_price }
    end
    
    def create
        @simulation = current_user.simulations.new(simulation_params)
        @simulation_already = current_user.simulations.find_by(item_id: params[:simulation][:item_id])
        if current_user.simulations.find_by(item_id: params[:simulation][:item_id])
            @new_amount = @simulation.amount + @simulation_already.amount
            @simulation_already.update(amount: @new_amount)
            redirect_to simulations_path
        else
            @simulation.save
            redirect_to simulations_path 
        end
        
        
    end
    
    def update
        @simulation = Simulation.find(params[:id])
        @simulation.update(simulation_params)
        redirect_to simulations_path
    end
    
    def destroy
        @simulation = Simulation.find(params[:id])
        @simulation.destroy
        redirect_to simulations_path
    end
    
    def destroy_all
        @simulations = current_user.simulations.all
        @simulations.destroy_all
        redirect_to simulations_path
    end
    
    private
    def simulation_params
        params.require(:simulation).permit(:user_id, :item_id, :amount)
    end    
end
