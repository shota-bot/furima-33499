class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_root_path
  before_action :credit_card_present

  def index
    redirect_to root_path if @item.order
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)

    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :house_num, :building, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id], customer_token: current_user.card.customer_token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
    )
  end

  def move_root_path
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def credit_card_present
    redirect_to new_card_path and return unless current_user.card.present?
  end

end
