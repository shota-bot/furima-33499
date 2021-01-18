class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :day

  
end
