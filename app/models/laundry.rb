class Laundry < ApplicationRecord
	validates :name, presence: true


	# Laundry laundries through join table
	has_many :shop_services, dependent: :destroy
	has_many :capabilities, through: :shop_services

  has_many :services

  has_many :order_laundries
  has_many :orders, through: :order_laundries

  has_many :laundry_capabilities
  has_many :capabilities, through: :laundry_capabilities

  has_many :capabilities

  validates :name, presence: true

end
