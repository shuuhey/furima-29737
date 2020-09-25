class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery
  belongs_to_active_hash :preparation
  belongs_to_active_hash :prefecture
  
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :caregory, :condition, :delivery, :preparation, :prefecture, presecnce: true
  validates :caregory_id, :condition_id, :delivery_id, :preparation_id, :prefecture_id, numericality: { other_than: 1 }
end
