class User::SimulationsController < ApplicationController
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
