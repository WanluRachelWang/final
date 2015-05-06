class User < ActiveRecord::Base
  has_many :marks
  has_many :tags, :through=> :marks
  has_many :replys
  has_many :posts
  has_many :likeship, class_name: 'Like', foreign_key: 'user_id'
  has_many :favorite_posts, :through=> :likeship, :source=> 'post'
  has_many :friendships, class_name: 'Friend', foreign_key: 'user_id'
  has_many :friends, class_name: 'User', :through=> :friendships, :source=>'buddy'
  has_many :followships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followers, class_name: 'User', :through=> :followships, :source=>'follower'

  has_many :followeeships, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followees, class_name: 'User', :through=> :followeeships, :source=>'followee'
end