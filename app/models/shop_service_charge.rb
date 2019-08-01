class ShopServiceCharge < ApplicationRecord
	belongs_to :shop
	belongs_to :laundry
	belongs_to :capability
end