class Capability < ApplicationRecord
	belongs_to :shop, optional: true
	validates :name, presence: true
end
