class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  validates :name,          presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,         presence: true
  validates :image,         presence: true

end
