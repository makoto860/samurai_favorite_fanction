class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :favorite]

  def index
    @products = Product.all
  end

  def show
    @reviews = @product.reviews
    @review = @reviews.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_url @product
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_url @product
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  def favorite
    current_user.toggle_like!(@product)
    redirect_to product_url @product
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :quantity)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
