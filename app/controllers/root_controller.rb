class RootController < ApplicationController
    def home
        render "home" #If the name is the same, then the render is going to try to render index by default. You can render "about" with render "about" in the index page. 
    end

    def about
        render "about"
    end

    def cart
        render "cart"
    end

    def listings
        render "listings"
    end

    def checkout
        @billing_address = BillingAddress.all
        render "checkout"
        
    end

    def checkoutpay
        @billing_address = BillingAddress.all
        render "checkoutpay"
        
    end

    def faq
        render "faq"
    end

    def contact
        #redirect_to('/about') #Redirects
        render "contact"
    end
    
    def api
        @response = {
            :status => 200,
            :message => "hello world"
        }
        render json: @response
    end

    def current_cart
        if session[:cart_id]
          @current_cart ||= Cart.find(session[:cart_id])
        end
        if session[:cart_id].nil?
          @current_cart = Cart.create!
          session[:cart_id] = @current_cart.id
        end
        @current_cart
    end 
    
    def show
        @cart = current_cart
    end

    def user
        render json: params #[:name] returns just the name
    end

    def addaddress
        #render json: params[:firstname]
        @billing_address = BillingAddress.new
        @billing_address.firstname = params[:firstname]
        @billing_address.lastname = params[:lastname]
        @billing_address.email = params[:email]
        @billing_address.address1 = params[:address1]
        @billing_address.address2 = params[:address2]
        @billing_address.country = params[:country]
        @billing_address.state = params[:state]
        @billing_address.zip = params[:zip]
        @billing_address.save

        @response = {
            :status => 200,
            :message => "saved successfully"
        }
        @billing_address = BillingAddress.all
        redirect_to('/checkoutpay')

        #render json: @billing_address
    end

    def checkoutbilling
        render "checkoutbilling"
    end
end
