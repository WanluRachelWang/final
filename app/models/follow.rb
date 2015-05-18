class Follow < ActiveRecord::Base
  belongs_to :followee, class_name: 'User', foreign_key: 'user_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  validates_presence_of :user_id
  validates_presence_of :follower_id
end
