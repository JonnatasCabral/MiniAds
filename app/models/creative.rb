class Creative
  include Mongoid::Document
  field :bid, type: Float
  field :adtext, type: String
  belongs_to :ad, class_name:"Ad"

  validates :bid, numericality: { greater_than: 0 }
  validates :adtext, presence: true 
  validate :bid_value

	def bid_value
		unless bid_validate
			errors.add(:bid, 'O bid deve ser menor que o budget')
		end
	end

	def bid_validate
		if self.bid and self.ad.budget
			self.bid < self.ad.budget
		end
	end

	def bid_mask
		return helper.number_to_currency(self.bid, precision: 2)
	end 

	private
	  def helper
	    @helper ||= Class.new do
	      include ActionView::Helpers::NumberHelper
	    end.new
	  end
end
