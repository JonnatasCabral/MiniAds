class DashboardController < ApplicationController

	def index
		@creatives = Ad.all
	end

	def details

	end
end
