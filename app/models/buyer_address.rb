class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phon_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buyer = Buyer.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phon_number: phon_number, buyer_id: buyer.id)
  end
end
