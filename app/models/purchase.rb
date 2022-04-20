class Purchase  < ActiveRecord::Base
    belongs_to :pant
    belongs_to :shirt
    belongs_to :shoe
 
end