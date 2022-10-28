class OrderItemController < ApplicationController
  def index
    @order_id =  params[:order_id]
  end

end
