class Purchase  < ActiveRecord::Base
    belongs_to :pant
    belongs_to :shirt
    belongs_to :shoe

    def self.deleteTable
        Purchase.all.destroy_all
    end
end