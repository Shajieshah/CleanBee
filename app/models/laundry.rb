class Laundry < ApplicationRecord
	validates :name, presence: true

	# Laundry laundries through join table
	has_many :shop_services, dependent: :destroy
	has_many :capabilities, through: :shop_services
	
end
