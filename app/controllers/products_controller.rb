class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(name: params[:product][:name], price: params[:product][:price])
    if @product.save
      flash[:notice] = '新規商品を追加しました'
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = '商品を削除しました'
    redirect_to products_path
  end
  
end
