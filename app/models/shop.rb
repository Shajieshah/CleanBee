class Shop < ApplicationRecord

	belongs_to :vendor

	# Shop capabilities through join table
	has_many :shop_capabilities, dependent: :destroy
	has_many :capabilities, through: :shop_capabilities

	# Shop Service Charges
	has_many :shop_service_charges, dependent: :destroy
	
end