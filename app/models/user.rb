# frozen_string_literal: true

class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :orders

  has_many :ratings

  # Favourite Shops
  has_many :favourite_shops, dependent: :destroy

  validates :email, :phone, uniqueness: true
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :email_or_phone_exist?, ->(email, phone) { where("email = ? OR  phone = ? ", email, phone) }

  enum role: { customer: 'customer', rider: 'rider' }

  def is_customer?
  	role.eql? 'customer'
  end

  def is_rider?
  	role.eql? 'rider'
  end

end
