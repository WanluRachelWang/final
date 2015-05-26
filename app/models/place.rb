class Place < ActiveRecord::Base

  validates :post_id, :restaurant_id, presence: true
end
