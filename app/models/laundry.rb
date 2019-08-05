class Laundry < ApplicationRecord

  has_many :services

  has_many :order_laundries
  has_many :orders, through: :order_laundries

  has_many :laundry_capabilities
  has_many :capabilities, through: :laundry_capabilities

  validates :name, presence: true

end
