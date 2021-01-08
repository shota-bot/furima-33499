class  UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_num, :building, :phone_num

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_num
    validates :phone_num, format: { with: /\A\d{,11}\z/, message: "is invalid. Don't include hyphen(-)"}
  end

  def save
    Order.create(user_id: current_user.id, item_id: params[:item_id])
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone_num: phone_num)
  end
end