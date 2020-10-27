class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [ :index]
  
  def index
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
