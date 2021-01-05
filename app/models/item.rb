class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300円〜9999999円以内で入力して下さい" }
    validates :image
    with_options numericality: { greater_than_or_equal_to: 2, message: "を選択した下さい" } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :prefectures_id
      validates :day_id
    end
  end
end
