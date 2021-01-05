class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day

 validates :name, :text, :price, :image, presence: true
 validates :category_id, :status_id, :postage_id, :prefectures_id, :day_id, numericality: { other_then: 1 }
end
