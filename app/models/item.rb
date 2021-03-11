class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost 
  belongs_to :area
  belongs_to :date

  validates :name, :info, :price, presence: true

  validates :category_id, :status_id, :cost_id, :area_id, :date_id, numericality: { other_than: 1 } 
end
