class Capability < ApplicationRecord

	has_many :laundry_capabilities
	has_many :laundries, through: :laundry_capabilities

	validates :name, presence: true
end