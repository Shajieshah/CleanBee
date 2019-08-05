class Vendor < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :shop, dependent: :destroy
  validates :email, uniqueness: true
end