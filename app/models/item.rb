class Item < ActiveRecord::Base
  validates :price,  numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }, on: :create 
end
