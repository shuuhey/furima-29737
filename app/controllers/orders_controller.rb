class OrdersController < ApplicationController
  before_action :set_order
  before_action :move_to_index

  def index
    @order = Order.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index

    if !user_signed_in?
    redirect_to new_user_session_path
    elsif current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
