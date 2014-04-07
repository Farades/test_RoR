class Item < ActiveRecord::Base
  #attr_accessible :name, :price, :weight, :description
  validates :price,  numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }, on: :create 
  has_many  :carts,  through: :positions
  has_many  :positions
  has_and_belongs_to_many :carts
end
