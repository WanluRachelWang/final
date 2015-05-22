# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Tag.delete_all
Post.delete_all
Picture.delete_all
Mark.delete_all
Like.delete_all
Reply.delete_all
Friend.delete_all
Follow.delete_all
Restaurant.delete_all
Place.delete_all

fakeData = JSON.parse(open('db/fakeData.json').read)

# User
#   user_name: string
#   password: string
#   salt: string
#   profile_pic_path: string
#   gender: boolean
#   id_created_time: datetime
#   nick_name: string
#   place: string
#   last_login_time: datetime

fakeData["users"].each do |user_hash|
	user = User.new
	user.user_name = user_hash["user_name"]
	user.password = user_hash["password"]
	user.salt = user_hash["salt"]
	user.profile_pic_path = user_hash["profile_pic_path"]
	user.gender = user_hash["gender"]
	user.id_created_time = Time.at(user_hash["id_created_time"]).to_datetime
	user.nick_name = user_hash["nick_name"]
	user.place = user_hash["nick_name"]
	user.last_login_time = Time.at(user_hash["last_login_time"]).to_datetime
	user.save
end

# Post
#   user_id: integer
#   post_time: datetime
#   post_text: text
#   latitude: string
#   longitude: string
#   restaurant_id: integer
#   restaurant_name: string
#   rating: integer

fakeData["posts"].each do |post_hash|
	post = Post.new
	post.user_id = post_hash["user_id"]
	post.post_time = Time.at(post_hash["post_time"]).to_datetime
	post.post_text = post_hash["post_text"]
	post.longitude = post_hash["longitude"]
	post.latitude = post_hash["latitude"]
	post.rating = post_hash["rating"]
	post.save
end

# Picture
#   post_id: integer
#   img_path: string

fakeData["pictures"].each do |picture_hash|
	picture = Picture.new
	picture.post_id = picture_hash["post_id"]
	picture.img_path = picture_hash["img_path"]
	picture.save
end

# Mark
#   user_id: integer
#   tag_id: integer

fakeData["marks"].each do |mark_hash|
	mark = Mark.new
	mark.user_id = mark_hash["user_id"]
	mark.tag_id = mark_hash["tag_id"]
	mark.save
end

# Like
#   user_id: integer
#   post_id: integer

fakeData["likes"].each do |like_hash|
	like = Like.new
	like.user_id = like_hash["user_id"]
	like.post_id = like_hash["post_id"]
	like.save
end

# Reply
#   user_id: integer
#   post_id: integer
#   content: text
#   time: datetime

fakeData["replies"].each do |reply_hash|
	reply = Reply.new
	reply.user_id = reply_hash["user_id"]
	reply.post_id = reply_hash["post_id"]
	reply.content = reply_hash["content"]
	reply.time = Time.at(reply_hash["time"]).to_datetime
	reply.save
end


# Friend
#   user_id: integer
#   friend_id: integer

fakeData["friends"].each do |friend_hash|
	friend = Friend.new
	friend.user_id = friend_hash["user_id"]
	friend.friend_id = friend_hash["friend_id"]
	friend.save
end

# Follow
#   user_id: integer
#   follower_id: integer

fakeData["follows"].each do |follow_hash|
	follow = Follow.new
	follow.user_id = follow_hash["user_id"]
	follow.follower_id = follow_hash["follower_id"]
	follow.save
end

# Tag
#   tag_name: string

Yelp.client.configure do |config|
  config.consumer_key = "qOxoGstzEM4ERC_BQxIltw"
  config.consumer_secret = "Tk1TpsaLK5aaSLTFgEfSDWhOkMQ"
  config.token = "Hdr0_0BjpxnItY1LtfNl-MrNEzIZbXvX"
  config.token_secret = "AXuqW-YSbjWrLmtgSDdJStG2_G0"
end

categories = JSON.parse(open('db/categories.json').read)

categories.each do |category|
  if category['parents'][0] == 'restaurants'

    params = { term: category['title']}

    locale = { lang: 'en' }

    response = Yelp.client.search('Chicago', params, locale)


    # Restaurant
    # yelp_id: string
    # name: string
    # image_url: string
    # url: string
    # phone: string
    # rating_img_url: string
    # location_display_address: string

    response.businesses.each do |business|
      restaurant = Restaurant.new
      restaurant.yelp_id = business.id
      restaurant.name = business.name

      if business.has_key?("image_url") &&
        restaurant.image_url = business.image_url
      else
        next
      end

      restaurant.url = business.url

      if business.has_key?("phone")
        restaurant.phone = business.phone
      elsif business.has_key?("display_phone")
        restaurant.phone = business.display_phone
      end

      restaurant.rating_img_url = business.rating_img_url
      restaurant.location_display_address = "#{business.location.display_address[0]},#{business.location.display_address[1]},#{business.location.display_address[2]}"
      puts business.name
      restaurant.save
    end
  end
end

puts 'Seed Successfully'










