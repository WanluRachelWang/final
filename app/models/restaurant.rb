class Restaurant < ActiveRecord::Base

  validates :yelp_id, presence: true, uniqueness: true, allow_nil: false
  validates :name, presence: true
  validates :url, presence: true
  validates :rating_img_url, presence: true
  validates :location_display_address, presence: true

end
