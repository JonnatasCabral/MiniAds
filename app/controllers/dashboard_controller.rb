class DashboardController < ApplicationController

	def index
		@creatives = Ad.all
	end
end
