class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_root_path
  before_action :search_item, only: [:index]

  def index
    @address = current_user.address
    redirect_to root_path if @item.order
    @user_order = UserOrder.new(postal_code: @address.postal_code, prefecture_id: @address.prefecture_id, city: @address.city, house_num: @address.house_num, building: @address.building, phone_num: @address.phone_num)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
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

end
