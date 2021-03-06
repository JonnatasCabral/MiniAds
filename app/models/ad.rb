class Ad
  include Mongoid::Document
  paginates_per 10
  has_many :creative,  class_name:"Creative"
  has_many :targeting, class_name:"Targeting"
  field :budget, type: Float

  accepts_nested_attributes_for :creative, allow_destroy: true
  accepts_nested_attributes_for :targeting, allow_destroy: true
  validates :budget, numericality: { greater_than: 0 , message: 'O Valor do budget deve ser maior que R$0.00'}
  validates :creative, length: { minimum: 1 , message: 'error: Deve ter pelo menos um Creative'}
  validates :targeting, length: { minimum: 1, message: 'error: Deve ter pelo menos um Targeting' }


  def creative_for_form
    collection = questions.where(ad_id: id)
    collection.any? ? collection : questions.build
  end
  
  def targeting_for_form
    collection = questions.where(ad_id: id)
    collection.any? ? collection : questions.build
  end


  def budget_mask
    return helper.number_to_currency(self.budget, precision: 2)
  end 

  def bid_value_total
    total = 0
    self.creative.each do |c|
      total += c.bid
    end 
    return total
  end

  private
    def helper
      @helper ||= Class.new do
        include ActionView::Helpers::NumberHelper
      end.new
    end
end
