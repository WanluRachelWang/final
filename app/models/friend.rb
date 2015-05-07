class Friend < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :buddy, class_name: 'User', foreign_key: 'friend_id'
end
