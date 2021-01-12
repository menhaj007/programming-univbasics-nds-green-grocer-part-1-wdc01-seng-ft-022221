def find_item_by_name_in_collection(name, collectionOfItems)
    foundItem = nil
    collectionOfItems.each do |element|
        element.each do |key, value|
            if (value == name)
                foundItem = element
                # puts foundItem
            end
        end
    end
    foundItem
  end

# def consolidate_cart(cart)
#     cart.each do |element|
#         element.map do |key, value|
#             # puts value
#         end
#     end
#     updateList = cart.tally
#     mystList = {}
#     consList = []
#     updateList.map do |key, value|
#         # puts "#{key}     #{value}"
#         # temp = {:count => nil}
#         temp = {}
#         key.each do |k, v|
#             temp[k] = v
#         end
#         temp[:count] = value
#         consList.push(temp)
#     end
#     # puts mystList
#     consList
# end


def consolidate_cart(cart)
    
    updated_cart = Array.new
    cart_index = 0
  
    while cart_index < cart.size do
      current_item = cart[cart_index]
      if ( find_item_by_name_in_collection( current_item[:item], updated_cart ) == nil)
        current_item[:count] = 1
        updated_cart.push(current_item)
      else
        increment_count_of_item( updated_cart, current_item[:item] )
      end
      cart_index += 1
    end
    updated_cart
  end
  def increment_count_of_item (cart, item_name)
    cart_index = 0
    while cart_index < cart.size do
      current_item = cart[cart_index]
      if ( current_item[:item] == item_name )
        current_item[:count] += 1
      end
      cart_index += 1
    end
    cart
  end