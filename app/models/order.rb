class Order < ApplicationRecord

  has_many :order_laundries
  has_many :laundries, through: :order_laundries

  belongs_to :shop

  has_many :services, through: :laundries

end
