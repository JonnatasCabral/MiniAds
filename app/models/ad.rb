class Ad
  include Mongoid::Document
  
  has_many :creative,  class_name:"Creative"
  has_many :targeting, class_name:"Targeting"
  field :budget, type: Float

  accepts_nested_attributes_for :creative,
	reject_if: proc { |attributes| attributes['bid', 'adtext'].blank? }
  accepts_nested_attributes_for :targeting
  validates :budget, numericality: { greater_than: 0 }
  validates :creative, :length => { :minimum => 1 }
  validates :targeting, :length => { :minimum => 1 }

end
