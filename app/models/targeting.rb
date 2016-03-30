class Targeting
  include Mongoid::Document

  field :places, type: String
  field :gender, type: String
  belongs_to :ad, class_name:"Ad"

end
