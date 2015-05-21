class RestaurantsController < ApplicationController
	
	before_action :check_configuration
  before_action :set_page_id

  #set page id for menu tab
  def set_page_id
		@page_id = "restaurants"
	end

	#check if there is already a configuration
  #otherwise create a configuration
	def check_configuration
		if Yelp.client.configuration == nil 

			Yelp.client.configure do |config|
			  config.consumer_key = "qOxoGstzEM4ERC_BQxIltw"
			  config.consumer_secret = "Tk1TpsaLK5aaSLTFgEfSDWhOkMQ"
			  config.token = "Hdr0_0BjpxnItY1LtfNl-MrNEzIZbXvX"
			  config.token_secret = "AXuqW-YSbjWrLmtgSDdJStG2_G0"
			end
		end
	end

	def index

		response = Yelp.client.search('Chicago', { term: 'food' })

		@businesses = response.businesses

	end

end