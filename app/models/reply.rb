class Reply < ActiveRecord::Base
	belongs_to :user
  belongs_to :post
  validates_presence_of :user_id
  validates_presence_of :post_id
  validates_presence_of :content
  validates_presence_of :time
end
