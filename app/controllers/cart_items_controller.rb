class CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    @cart_item = current_cart.cart_items.build(qty: params[:cart_item][:qty], product_id: params[:cart_item][:product_id])
    if @cart_item.save
      flash[:notice] = 'カートに商品を追加しました'
      redirect_to cart_path(current_cart)
    else
      @product = Product.find(cart_item_params[:product_id])
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = 'カートから商品を削除しました'
    redirect_to cart_path(current_cart)
  end

end
