class Targeting
  include Mongoid::Document

  field :places, type: String
  field :gender, type: String

end
