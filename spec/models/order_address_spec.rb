require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入が上手くいくとき' do
      it '全てのデータが正しく入力されていると購入できる' do
        expect(@order).to be_valid
      end
      it 'building_nameがなくても購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入が上手くいかない時' do
      it 'クレジットカードのトークンが空のだと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @order.postal_code = '3310064'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が選択されていないと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture is invalid")
      end
      it '市区町村が入力されていないと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていないと購入できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が入力されていないと購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @order.phone_number = '090-12341234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order.phone_number = '090123412345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end    
