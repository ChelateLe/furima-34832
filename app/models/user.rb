class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: /\A[ぁ-んァ-ン一-龥]/
    validates :first_name_kana, format: /\A[ァ-ヶー－]+\z/
    validates :family_name, format: /\A[ぁ-んァ-ン一-龥]/
    validates :family_name_kana, format: /\A[ァ-ヶー－]+\z/
    validates :birth_date 
  end

  has_many :items
  has_many :purchase_records
end
