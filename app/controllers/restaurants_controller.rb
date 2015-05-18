class RestaurantsController < ApplicationController
	
	before_action :check_configuration

	def check_configuration
		#check if there is already a configuration
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