class Ad
  include Mongoid::Document
  paginates_per 10
  has_many :creative,  class_name:"Creative"
  has_many :targeting, class_name:"Targeting"
  field :budget, type: Float

  accepts_nested_attributes_for :creative, allow_destroy: true
  accepts_nested_attributes_for :targeting, allow_destroy: true
  validates :budget, numericality: { greater_than: 0 }
  validates :creative, :length => { :minimum => 1 }
  validates :targeting, :length => { :minimum => 1 }


  def creative_for_form
    collection = questions.where(ad_id: id)
    collection.any? ? collection : questions.build
  end
  
  def targeting_for_form
    collection = questions.where(ad_id: id)
    collection.any? ? collection : questions.build
  end

end
