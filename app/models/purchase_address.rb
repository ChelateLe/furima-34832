class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :cities, :house_number, :building, :phone_number, :user_id, :item_id

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, cities: cities, house_number: house_number, building: building, purchase_record_id: purchase_record)
  end
end