class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: /\A[ぁ-んァ-ン一-龥]/
  validates :first_name_kana, presence: true, format: /\A[ァ-ヶー－]+\z/
  validates :family_name, presence: true, format: /\A[ぁ-んァ-ン一-龥]/
  validates :family_name_kana, presence: true, format: /\A[ァ-ヶー－]+\z/
  validates :birth_date, presence: true 

  has_many :items
  has_many :purchase_records
end
