class User < ActiveRecord::Base
  has_one  :cart
  has_many :orders, dependent: :destroy
  attr_accessible :cart
end
