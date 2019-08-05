class OrderLaundry < ApplicationRecord

  belongs_to :order
  belongs_to :laundry

end