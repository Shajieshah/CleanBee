class Shop < ApplicationRecord

	belongs_to :vendor

	# Shop laundries through join table
	has_many :shop_services, dependent: :destroy
	has_many :laundries, through: :shop_services

end