class Ad
  include Mongoid::Document
  
  has_many :creative,  class_name:"Creative"
  has_many :targeting, class_name:"Targeting"
  field :budget, type: Float

  validates :budget, numericality: { greater_than: 0 }
  validates :creative, :length => { :minimum => 1 }
  validates :targeting, :length => { :minimum => 1 }

end
