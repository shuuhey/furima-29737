class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery
  belongs_to_active_hash :preparation
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price,          numericality: { only_integer: true, greater_than: 299, less_than_or_equal_to: 9_999_999 }
    validates :category_id,    numericality: { other_than: 1, message: 'is invalid' }
    validates :condition_id,   numericality: { other_than: 1, message: 'is invalid' }
    validates :delivery_id,    numericality: { other_than: 1, message: 'is invalid' }
    validates :preparation_id, numericality: { other_than: 1, message: 'is invalid' }
    validates :prefecture_id,  numericality: { other_than: 1, message: 'is invalid' }
  end
end
