class User < ApplicationRecord
  belongs_to :order
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true
  # validates :email, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :address, presence: true
  # validates :address2, presence: true
  validates :cardname, presence: true
  validates :creditcardnumber, presence: true
  validates :expiration, presence: true
  validates :cvv, presence: true
end
