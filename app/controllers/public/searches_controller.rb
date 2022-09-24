class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'current_customer'
          @records = Item.search_for(@content,@method)
    else  
          @records = Genre.search_for(@content,@method)
    end
  end
end
