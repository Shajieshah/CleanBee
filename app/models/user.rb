# frozen_string_literal: true

class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :email_or_phone_already_exist?, ->(email, phone) {where("email = ? OR  phone = ? ", email, phone)}
  scope :exist?, ->(email, phone) {where('email = ? OR phone = ?', email, phone)}

  enum role: { customer: "customer", rider: "rider", vendor: "vendor" }

  def customer?
  	role == "customer"
  end

  def vendor?
  	role == "vendor"
  end

  def rider?
  	role == "rider"
  end

end
