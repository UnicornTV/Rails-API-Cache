class Video
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :mp4, type: String
  field :cover, type: String
  field :category, type: String
end
