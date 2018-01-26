class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items
    
    def add_item(item_id)
        existing = self.line_items.detect{|l| l.item_id == item_id.to_i}

        if !existing
            #self.line_items << Line_Item.new({item_id: item_id, cart_id: self.cart_id, quantity: 1})
            self.line_items.new({item_id: item_id, quantity: 1})
            #self.save
        else
            existing.quantity += 1
            existing.save
            #this is awkward
            existing
        end
    end
    
    def total
        self.line_items.reduce(0) {|sum,i| 
            sum + (i.item.price * i.quantity)
        }
    end
    
    def checkout
        self.line_items.each {|e|
            e.item.inventory -= e.quantity
            e.item.save
        }
        self.status = "submitted"
        self.save
        #binding.pry
    end
    
end
