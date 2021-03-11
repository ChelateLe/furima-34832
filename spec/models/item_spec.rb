require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '出品がうまくいくとき' do
        it '入力項目を全て満たせば出品できる' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまくいかない時' do
        it 'nameが空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'infoが空では出品できない' do
          @item.info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end

        it 'imageが空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'priceが空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが299以下では出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceが10000000以上では出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'priceが全角では出品できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角でも文字なら出品できない' do
          @item.price = 'abc'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが英数混合なら出品できない' do
          @item.price = '1a2b3c'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'カテゴリーを選択しないと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it '商品の状態を選択しないと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it '配送料の負担を選択しないと出品できない' do
          @item.cost_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be other than 1")
        end

        it '発送元の地域を選択しないと出品できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end

        it '発送までの日数を選択しないと出品できない' do
          @item.furimadate_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Furimadate must be other than 1")
        end
      end    
    end
  end  

end
