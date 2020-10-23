class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charger
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date
  has_one_attached :image

  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :delivery_charger
    validates :prefecture
    validates :delivery_date
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charger_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end
