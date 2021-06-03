class Cart < ActiveRecord::Base
    has_many :items
        
    def add_item(product_params)
        current_item = items.find_by(product_id: product_params[:product][:product_id])
        if current_item
            # increase the quantity of product in cart
            current_item.product_params[:product][:quantity].to_i
            current_item.save
        else
            # product does not exist in cart
            new_item = cart_items.create(product_id: product_params[:product][:product_id],
                quantity: product_params[:product][:quantity],
                cart_id: self.id)
        end
        new_item
        save
    end

    private

    def set_cart
        @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
        
    def total_price
        items.to_a.sum(&:full_price)
    end

    # def add_item(product_id)
    #     item = items.where('product_id = ?', product_id).first
    #     if item
    #       # increase the quantity of product in cart
    #       item.quantity + 1
    #       save
    #     else
    #       # product does not exist in cart
    #       cart.items << Item.new(product_id: product_id, quantity: 1)
    #     end
    #     save
    #   end
end
        