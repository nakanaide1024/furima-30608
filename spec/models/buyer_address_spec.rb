require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe "商品購入機能" do
    context "正常に購入できるとき" do
      it "情報が正しく揃っていれば購入できる" do
        expect(@buyer_address).to be_valid
      end
    end

    context "正常に購入できないとき" do
      it "tokenが無ければ購入できない" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号がないと登録できない" do
        @buyer_address.post_code = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @buyer_address.post_code = "1234567"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid")
      end
      it "郵便番号が全角数字だと登録できない" do
        @buyer_address.post_code = "１２３−４５６７"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid")
      end
      it "都道府県が未入力だと登録できない" do
        @buyer_address.prefecture_id = "1"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村がないと登録できない" do
        @buyer_address.city = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと登録できない" do
        @buyer_address.house_number = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号がないと登録できない" do
        @buyer_address.phon_number = ""
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phon number can't be blank")
      end
      it "電話番号が12桁以上だと登録できない" do
        @buyer_address.phon_number = "123456789012"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phon number is invalid")
      end
      it "電話番号が全角数字だと登録できない" do
        @buyer_address.phon_number = "１２３４５６７８９０１"
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phon number is invalid")
      end
    end
  end
    
end
