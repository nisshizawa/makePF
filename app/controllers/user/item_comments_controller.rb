class User::ItemCommentsController < ApplicationController
    def create
        item = Item.find(params[:item_id])
        comment = current_user.item_comments.new(item_comment_params)
        comment.item_id = item.id
       if  comment.save
        redirect_to item_path(item)
       else
      redirect_to item_path(item), alert: "hogehoge error"
       end
        
    end
    
    def destroy
        ItemComment.find(params[:id]).destroy
        redirect_to item_path(params[:item_id])
    end
    
    
    private
    
    def item_comment_params

        params.require(:item_comment).permit(:comment).merge({rate: params[:score]})
    end
end
