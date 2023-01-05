class User::HomesController < ApplicationController
  def top
    @genres = Genre.all
    
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
    else
      @items = Item.all
    end
    
  end

  def about
  end
end
