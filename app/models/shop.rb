class Shop < ApplicationRecord

	belongs_to :user, foreign_key: :vendor_id

	# Shop capabilities through join table
	has_many :shop_capabilities, dependent: :destroy
	has_many :capabilities, through: :shop_capabilities

end