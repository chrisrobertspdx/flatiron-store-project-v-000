class CartsController < ApplicationController
    def show
        
    end
    def checkout
        @cart = current_user.current_cart
        @cart.checkout
        current_user.current_cart = nil
        current_user.save
        notice = "Order Submitted"
        redirect_to cart_path(@cart)
    end
end
