class Order < ApplicationRecord

  has_many :order_laundries
  has_many :laundries, through: :order_laundries

  belongs_to :shop

  has_many :services, through: :laundries

  enum status: { 

  		 pending: 'pending',
			 ready_to_pickup: 'ready_to_pickup',
			 assigned: 'assigned',
			 picked_up_from_customer: 'picked_up_from_customer',
			 dropped_to_vendor: 'dropped_to_vendor',
			 ready_to_deliver: 'ready_to_deliver',
			 picked_up_from_vendor: 'picked_up_from_vendor',
			 compleetd: 'completed'
  }

  scope :on_going_by_vendor,  -> { where('status ILIKE ? OR status ILIKE ? OR status ILIKE ? OR status ILIKE ? OR status ILIKE ?',
  																			 'assigned',
  																			 'picked_up_from_customer',
  																			 'dropped_to_vendor',
  																			 'ready_to_deliver',
  																			 'picked_up_from_vendor'
  																			 ) }

  scope :ready_to_pickup, -> { where(status: 'ready_to_pickup') }

  scope :completed, -> { where(status: 'completed') }

end
