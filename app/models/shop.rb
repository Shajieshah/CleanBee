class Shop < ApplicationRecord

	belongs_to :user, foreign_key: :vendor_id
	has_many :capabilities, dependent: :destroy

end
