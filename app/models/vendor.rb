class Vendor < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :shop, dependent: :destroy
  accepts_nested_attributes_for :shop
  validates :email, uniqueness: true

  after_create :create_vendor_shop

  def create_vendor_shop
  	self.create_shop!	
  end

end