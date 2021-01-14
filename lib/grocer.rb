grocery_shelf = [
    { :item => "CANNED BEANS", :price => 3.00, :clearance => true },
    { :item => "CANNED CORN", :price => 2.50, :clearance => false },
    { :item => "SALSA", :price => 1.50, :clearance => false },
    { :item => "TORTILLAS", :price => 2.00, :clearance => false },
    { :item => "HOT SAUCE", :price => 1.75, :clearance => false },
    { :item => "CANNED BEANS", :price => 3.00, :clearance => true }
  ]
  grocer = [
    {:item => "AVOCADO", :price => 3.00, :clearance => true},
    {:item => "KALE", :price => 3.00, :clearance => false},
    {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
    {:item => "ALMONDS", :price => 9.00, :clearance => false},
    {:item => "TEMPEH", :price => 3.00, :clearance => true},
    {:item => "CHEESE", :price => 6.50, :clearance => false},
    {:item => "BEER", :price => 13.00, :clearance => false},
    {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
    {:item => "BEETS", :price => 2.50, :clearance => false},
    {:item => "SOY MILK", :price => 4.50, :clearance => true},
    {:item => "SOY MILK", :price => 4.50, :clearance => true}
  ]

  def find_item_by_name_in_collection(name, collectionOfItems)
    foundItem = nil
    collectionOfItems.each do |element|
        element.each do |key, value|
            if (value == name)
                foundItem = element
            end
        end
    end
    foundItem
  end

#   puts find_item_by_name_in_collection("BEErTS", grocer)
#   puts find_item_by_name_in_collection("CANNED CORN", grocery_shelf)


unconsolidated_cart = [
    {:item => "AVOCADO", :price => 3.00, :clearance => true },
    {:item => "AVOCADO", :price => 3.00, :clearance => true },
    {:item => "KALE", :price => 3.00, :clearance => false}
  ]
  
  result = [
                {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 2},
                {:item => "KALE", :price => 3.00, :clearance => false, :count => 1}
            ]
  def update_counts (item_name, half_cosolidated_cart)
    index = 0
    while index < half_cosolidated_cart.size do
      current_item = half_cosolidated_cart[index]
      if ( current_item[:item] == item_name )
        current_item[:count] += 1
      end
      index += 1
    end
    half_cosolidated_cart
  end

  def consolidate_cart(unconsolidated_cart)
    consolidated_cart = Array.new
    index = 0
    while index < unconsolidated_cart.length do
        current_item = unconsolidated_cart[index]
        # puts current_item[:item]
        if (find_item_by_name_in_collection(current_item[:item], consolidated_cart) == nil)
          current_item[:count] = 1
          consolidated_cart.push(current_item)
        else 
          update_counts(current_item[:item], consolidated_cart)
        end
        index += 1
    end
    consolidated_cart
  end
  puts consolidate_cart(unconsolidated_cart)

  