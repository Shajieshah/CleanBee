class Order < ApplicationRecord

  has_many :order_laundries
  has_many :laundries, through: :order_laundries

  belongs_to :shop

  has_many :services, through: :laundries

  # opened orders for vendors
  # scope :opened, -> { where(status: 'open') }
  scope :opened, ->(shop){ where(shop_id: shop.id, status: 'open') }

end
