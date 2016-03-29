class Ad
  include Mongoid::Document
  has_many :creative
  has_many :targeting
  field :budget, type: Float

end
