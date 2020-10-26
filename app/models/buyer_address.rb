class UserDonation
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture
    validates :city
    validates :house_number
    validates :phon_number format: {with: /\A\d{10,11}\z/}
  end

  validates :prefecture_id numericality: {with: other_than: 0}

  def save
    product = Product.find(params[:id])
    buyer = Buyer.create(user_id: current_user.id, product_id: product.id)
    Address.create(post_code: postcode, prefecture_id: prefecture_id, city: city, house_number:, house_number, building_number: building_number, phon_number: phon_number, buyer_id: buyer.id)
end