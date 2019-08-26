# frozen_string_literal: true

class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :owned_orders,    class_name: "Order", foreign_key: "owner_id"
  has_many :assigned_orders, class_name: "Order", foreign_key: "assignee_id"

  has_many :ratings

  has_many :notifications

  # Favourite Shops
  has_many :favourite_shops, dependent: :destroy

  has_many :reported_orders

  validates :email, :phone, uniqueness: true
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :email_or_phone_exist?, ->(login) { where("email = ? OR  phone = ? ", login, login) }

  enum role: { customer: 'customer', rider: 'rider' }

  def is_customer?
  	role.eql? 'customer'
  end

  def is_rider?
  	role.eql? 'rider'
  end

end
