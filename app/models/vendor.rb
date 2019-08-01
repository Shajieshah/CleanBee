class Vendor < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :shop, dependent: :destroy
  validates :email, uniqueness: true
end
