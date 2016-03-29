class Creative
  include Mongoid::Document
  field :budget, type: Float
  field :adtext, type: String

end
