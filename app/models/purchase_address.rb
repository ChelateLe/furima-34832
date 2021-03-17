class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :cities, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :cities
    validates :house_number
    validates :phone_number 
    validates :token, presence: true
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, cities: cities, house_number: house_number, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end