class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :scheduled_day

  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true}, presence: true
  validates :image,            presence: true

  def sold_out?
    Order.exists?(item_id: id)
  end

end
