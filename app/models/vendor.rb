class Vendor < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :shop, dependent: :destroy
  accepts_nested_attributes_for :shop
  validates :email, uniqueness: true
end