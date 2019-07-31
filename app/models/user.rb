# frozen_string_literal: true

class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :shop, foreign_key: :vendor_id, dependent: :destroy
  validates :email, :phone, uniqueness: true
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
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
