class Shop < ApplicationRecord

	belongs_to :vendor

	# Shop laundries through join table
	has_many :shop_services, dependent: :destroy
	has_many :laundries, through: :shop_services

	has_many :capabilities, through: :laundries_capabilities

  has_many :orders

	# Shop Service Charges
	has_many :shop_service_charges, dependent: :destroy
	
end