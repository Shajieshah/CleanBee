class Order < ApplicationRecord

  belongs_to :owner,    class_name: "User", foreign_key: "owner_id"
  belongs_to :assignee, class_name: "User", foreign_key: "assignee_id", optional: true

  has_many :order_laundries
  has_many :laundries, through: :order_laundries

  has_many :laundry_capabilities
  has_many :capabilities, through: :laundry_capabilities

  belongs_to :shop
  enum status: {

      pending: 'pending',
      start: 'start',
      ready_to_pickup: 'ready_to_pickup',
      assigned: 'assigned',
      picked_up_from_customer: 'picked_up_from_customer',
      dropped_to_vendor: 'dropped_to_vendor',
      ready_to_deliver: 'ready_to_deliver',
      picked_up_from_vendor: 'picked_up_from_vendor',
      compleetd: 'completed'
  }

  scope :on_going_by_vendor, -> {where('status ILIKE ? OR status ILIKE ? OR status ILIKE ? OR status ILIKE ? OR status ILIKE ?',
                                       'assigned',
                                       'picked_up_from_customer',
                                       'dropped_to_vendor',
                                       'ready_to_deliver',
                                       'picked_up_from_vendor'
  )}

  reverse_geocoded_by :pick_lat, :pick_lng

  scope :completed, -> {where(status: 'completed')}

end
