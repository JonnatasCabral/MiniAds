require 'test_helper'

class AdTest < ActiveSupport::TestCase
	
	test "should not save new ad" do
  	ad = Ad.new
  	assert !ad.save, "Saved not the ad without creative and targeting"
	end

end
