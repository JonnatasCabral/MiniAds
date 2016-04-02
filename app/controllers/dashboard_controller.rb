class DashboardController < ApplicationController

	before_action :set_ad, only: [:show, :edit, :update, :destroy]

	def index
		@ads = Ad.all
	end

	def show
		@creatives = Creative.all
		@targets = Targeting.all
	end

	def new
		@ad = Ad.new
		@ad.creative.build
		@ad.targeting.build
	end

	def destroy
		@ad.destroy
    	respond_to do |format|
      	format.html { redirect_to people_url, notice: 'Ad was successfully destroyed.' }
      	format.json { head :no_content }
    	end
	end

	def create
    	@ad = Ad.new(ad_params)

	    respond_to do |format|
	      if @ad.save
	        format.html { redirect_to @ad, notice: 'ad was successfully created.' }
	        format.json { render :show, status: :created, location: @ad }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @ad.errors, status: :unprocessable_entity }
	      end
	    end
	end



	private
		def set_ad
      		@ad = Ad.find(params[:id])
    	end

		def ad_params
	      params.require(:ad).permit(:budget,
	      	creative:[:id, :bid, :adtext],
	      	creative:[:id, :places, :gender])
	    end
end
