class User::ItemCommentsController < ApplicationController
     before_action :authenticate_user!

     before_action :guest_check
     
    def guest_check
        if current_user.email=='guest@example.com'
          redirect_to user_homes_top_path,notice: "このページを見るには会員登録が必要です。"
        end
    end     

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
