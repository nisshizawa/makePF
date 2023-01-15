class User::HomesController < ApplicationController
  def top

  end

  def about
  end
  
  def search
        @genres = Genre.all        
        @items = Item.order('id DESC').limit(4)
        
        if params[:genre_id].present?
          @items = Item.where(genre_id: params[:genre_id])
        else
          @items = Item.all
        end        
   
        
  end
end
