class Shop < ApplicationRecord

	belongs_to :vendor

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	# Shop laundries through join table
	has_many :shop_services, dependent: :destroy
	has_many :laundries, through: :shop_services

	has_many :capabilities, through: :laundries_capabilities

	has_many :orders

	has_many :ratings

	# Shop Service Charges
	has_many :shop_service_charges, dependent: :destroy
	
end