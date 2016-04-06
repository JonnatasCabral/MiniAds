class Targeting
  include Mongoid::Document

  field :places, type: Array, default: []
  field :gender, type: String
  
  belongs_to :ad, class_name:"Ad"

  def places_list=(arg)
    self.places = arg.split(',').map { |v| v.strip }
  end

  def places_list
    self.places.join(', ')
  end

end
