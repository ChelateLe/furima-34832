class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: /\A[ぁ-んァ-ン一-龥々]+\z/
    validates :first_name_kana, format: /\A[ァ-ヶー－]+\z/
    validates :family_name, format: /\A[ぁ-んァ-ン一-龥々]+\z/
    validates :family_name_kana, format: /\A[ァ-ヶー－]+\z/
    validates :birth_date 
  end

  validates :password, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  has_many :items
  has_many :purchase_records
end
