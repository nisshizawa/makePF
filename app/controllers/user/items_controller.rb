class User::ItemsController < ApplicationController
    def top
        @items = Item.order('id DESC').limit(4)
   
        
    end    
    def index
        @genres = Genre.all
        if params[:genre_id]
            @genre = Genre.find(params[:genre_id])
            all_items = @genre.items
        else
            all_items = Item.all
        end
        @items = all_items
        @genres = Genre.all
        
        if params[:genre_id].present?
          @items = Item.where(genre_id: params[:genre_id])
        else
          @items = Item.all
        end
        
    end
    
    def show
        @item = Item.find(params[:id])
        @item_comment = ItemComment.new
    end
    

        
    private
    def item_params
        params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id)
    end
end
