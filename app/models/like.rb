class Like < ActiveRecord::Base
   belongs_to :chef
   belongs_to :reecipe
   
   validates_uniqueness_of :chef, scope: :reecipe
end