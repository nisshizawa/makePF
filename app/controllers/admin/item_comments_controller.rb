class Admin::ItemCommentsController < ApplicationController
  def index
    @item_comments = ItemComments.all
  end
    
  def destroy
        
  end
end
