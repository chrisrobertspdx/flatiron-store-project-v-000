class LineItemsController < ApplicationController
    def create
        init_current_cart
        current_user.current_cart.add_item(params[:item_id])
        #not sure why save here
        current_user.current_cart.save
        redirect_to cart_path(current_user.current_cart)
    end

end
