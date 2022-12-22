class Simulation < ApplicationRecord
    belongs_to :user
    belongs_to :item
    
    def subtotal
        item.with_tax_price * amount
    end
    
    def sum_of_price
        item.with_tax_price * amount
    end  
    
    def with_tax_price
        (price * 1.1).floor
    end    
end
