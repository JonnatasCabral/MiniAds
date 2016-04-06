class Creative
  include Mongoid::Document
  field :bid, type: Float
  field :adtext, type: String
  belongs_to :ad, class_name:"Ad"

  validates :bid, numericality: { greater_than: 0 }
  validates :adtext, presence: true 


end
