class User::ItemsController < ApplicationController
      def search
        @genres = Genre.all        
        if params[:genre_id].present?
          @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(5)
        else
          @items = Item.page(params[:page]).per(5)
        end  
      end
  
    def index
        @genres = Genre.all
        if params[:genre_id]
            @genre = Genre.find(params[:genre_id])
            all_items = @genre.items
        else
            all_items = Item.all
        end
        @items = all_items.page(params[:page]).per(5)
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