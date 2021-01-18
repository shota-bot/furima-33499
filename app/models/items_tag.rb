class ItemsTag

  include ActiveModel::Model
  attr_accessor :name, :text, :price, :images, :category_id, :status_id, :postage_id, :prefecture_id, :day_id, :user_id, :tagname
  
  with_options presence: true do
    validates :name
    validates :text
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'を300円〜9999999円以内で入力して下さい' }
    validates :images
    with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :prefecture_id
      validates :day_id
    end
  end

  def save
    item = Item.create(name: name, text: text, price: price, category_id: category_id, status_id: status_id, postage_id: postage_id, prefecture_id: prefecture_id, day_id: day_id, user_id: user_id, images: images)

    tag = Tag.where(tagname: tagname).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end