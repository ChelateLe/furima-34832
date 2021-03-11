class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost 
  belongs_to :area
  belongs_to :furimadate
  has_one_attached :image

  validates :name, :info, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :category_id, :status_id, :cost_id, :area_id, :furimadate_id, numericality: { other_than: 1 } 
end
