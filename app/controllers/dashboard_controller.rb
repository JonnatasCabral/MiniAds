class DashboardController < ApplicationController

	before_action :set_ad, only: [:show, :edit, :update, :destroy]

	def index
		@ads = Ad.all.page params['page']
	end

	def show
		@ad = Ad.find(params[:id])
	end

	def new
		@ad = Ad.new
		@ad.creative.build
		@ad.targeting.build
	end

	def create
    	@ad = Ad.new(ad_params)
	    respond_to do |format|
	      if @ad.save
	        format.html { redirect_to @ad, notice: 'Ad criado com sucesso.' }
	      else
	        format.html { render action: 'new' }
	      end
	    end
	end

	def update
	    respond_to do |format|
	      if @ad.update(ad_params)
	        format.html { redirect_to @ad, notice: 'Ad atualizado com sucesso.' }
	      else
	        format.html { render action: 'new' }
	      end
	    end
	end

	def edit
    	@ad = Ad.find(params[:id])
  	end
	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy
    	respond_to do |format|
	      	format.html { redirect_to @ad, notice: 'Ad foi deletadod com sucesso.' }
    	end
	end

	private
		def set_ad
      		@ad = Ad.find(params[:id])
    	end

		def ad_params
	      params.require(:ad).permit(:budget,
	      	creative_attributes:[:id, :bid, :adtext, :_destroy],
	      	targeting_attributes:[:id, :places_list, :places, :gender, :_destroy])
	    end
end
