class Cart < ActiveRecord::Base
  belongs_to              :user
  validates               :user, presence: true
  validates               :user_id, uniqueness: true
  has_and_belongs_to_many :items
  has_many                :positions
  attr_accessible         :user_id, :id

  def add_item(i)
    if items.include?(i)
      positions.where(item_id: i.id).first.increment!(:quantity)
    else 
      positions.create(item: i, quantity: 1)
      items << i
    end
  end

  def remove_item(i)
    if items.include?(i)
      if positions.where(item_id: i.id).first.quantity > 1
        positions.where(item_id: i.id).first.decrement!(:quantity)
      else 
        positions.where(item_id: i.id).first.try(:destroy)
        items.where(id: i.id).first.try(:destroy)
      end
    end
  end

  def remove_position(position_to_remove_id)
    positions.where(item_id: position_to_remove_id).first.try(:destroy)
  end

end
