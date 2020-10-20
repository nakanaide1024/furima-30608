require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが正しく存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '既に登録されているemailは登録できない' do
      @user.save
      anuther_user = FactoryBot.build(:user)
      anuther_user.email = @user.email
      anuther_user.valid?
      expect(anuther_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@がないものは登録できない' do
      @user.email = "aofononsnonis.co.jp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが６文字未満では登録できない' do
      @user.password = "111aa"
      @user.password_confirmation = "111aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが存在してもpassword_confirmationが存在していなければ登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationの値が一致しないと登録できない' do
      @user.password = "aaaa11"
      @user.password_confirmation = "aaaa22"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordに全角英数字が入っている場合は登録できない' do
      @user.password = "AAa５５5"
      @user.password_confirmation = "AAa５５5"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが半角英字のみでは登録できない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが半角数字のみでは登録できない' do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'last_nameが空では登録できない'do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名は半角の入力では登録できない' do
      @user.last_name = "ｶﾀ"
      @user.first_name = "ｶﾀ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end
    it 'ユーザー本名は全角平仮名のみでも登録できる' do
      @user.last_name = "しもだ"
      @user.first_name = "のりこ"
      expect(@user).to be_valid
    end
    it 'ユーザー本名は全角カタカナのみでも登録できる' do
      @user.last_name = "シモダ"
      @user.first_name = "ノリコ"
      expect(@user).to be_valid
    end
    it 'フリガナの苗字が空だと登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'フリガナの名前が空だと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'フリガナは半角カタカナでは登録できない' do
      @user.last_name_kana = "ｼﾓﾀﾞ"
      @user.first_name_kana = "ﾉﾘｺ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end
    it '生年月日が空だと登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
