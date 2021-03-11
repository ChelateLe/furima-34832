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
      end    
    end
  end  

end
