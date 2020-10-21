class Product < ApplicationRecord

  belongs_to :User

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :delivery_charger_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :price
  end
end
