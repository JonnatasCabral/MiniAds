class DashboardController < ApplicationController

	def index
		@creatives = Creative.all
	end
end
