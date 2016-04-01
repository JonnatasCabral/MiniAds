class DashboardController < ApplicationController

	def index
		@ads = Ad.all
	end

	def details
		@creatives = Creative.all
		@targets = Targeting.all
	end

	def new
		@ad = Ad.new
		@creatives = Creative.new
		@targeting = Targeting.new
	end



	private
		def params
	      params.require(:ad).permit(:budget)
	    end
end
