class Dado < ActiveRecord::Base
  belongs_to :tracksegment
  has_attached_file :gpx
end
