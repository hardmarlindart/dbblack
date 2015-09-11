class Tracksegment < ActiveRecord::Base
  belongs_to :xml
  has_many :dados, :dependent => :destroy
end
