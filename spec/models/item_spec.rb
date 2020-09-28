require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品が上手くいくとき' do
      it '全てのデータが正しく入力されていると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が上手くいかない時' do
      it 'imageが存在しないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is invalid')
      end
      it '商品の状態が選択されていないと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is invalid')
      end
      it '配送料について選択されていないと登録できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery is invalid')
      end
      it '発送元の地域が選択されていないと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is invalid')
      end
      it '発送までの日数が選択されていないと登録できない' do
        @item.preparation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation is invalid')
      end
      it '価格が入力されていないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '価格が¥1,000,000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数字以外だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
