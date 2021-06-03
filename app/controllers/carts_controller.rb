class CartsController < ApplicationController
    before_action :set_cart, only: [:create, :destroy]
   
    def create
      @cart.add_item(params)
       
      if @cart.save
        redirect_to cart_path
      else
        flash[:error] = 'There was a problem adding this item to your cart.'
        redirect_to @product
      end
    end

    def destoy
        @cart_item.destroy
        redirect_to cart_path
    end


    def show
      @cart = current_cart
    end
 


    # def add_to_cart
    #     current_cart.add_item(params[:product_id])
    #     redirect_to carts_path(current_cart.id)
    # end
 
end