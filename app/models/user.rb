class User < ActiveRecord::Base
  has_many :marks
  has_many :tags, :through=> :marks
  has_many :replys
  has_many :posts
  has_many :likes
  has_many :friends
  has_many :follows
end