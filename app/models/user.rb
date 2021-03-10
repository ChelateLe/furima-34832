class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :family_name, presence: true
  validates :birth_date, presence: true 

  has_many :items
  has_many :purchase_records
end
