require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品登録' do
    context '出品が上手くいく時' do
      it '画像、商品名、商品説明、カテゴリー、状態、発送料の負担、発送元の地域、発送までの日数、価格が全て正しければ登録できる' do
        expect(@product).to be_valid
      end
    end

    context '出品が上手くいかない時' do
      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空では登録できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未入力では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it '状態が未入力では登録できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition must be other than 1')
      end
      it '発送料の負担が未入力では登録できない' do
        @product.delivery_charger_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery charger must be other than 1')
      end
      it '発送までの日数が未入力では登録できない' do
        @product.delivery_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery date must be other than 1')
      end
      it '発送元が未入力では登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '価格が未入力では登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字では登録できない' do
        @product.price = '５６７'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it '価格が漢数字では登録できない' do
        @product.price = '五百六'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300円未満では登録できない' do
        @product.price = 250
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格が9999999円より上では登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 9999999')
      end
    end
  end
end
