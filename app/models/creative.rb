class Creative
  include Mongoid::Document
  field :bid, type: Float
  field :adtext, type: String
  belongs_to :ad, class_name:"Ad"

  validates :bid, presence: true  
  validates :adtext, presence: true 


end
