class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_product, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_product
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    set_product
    redirect_to root_path if current_user.id == @product.user.id || @product.buyer.present?
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
