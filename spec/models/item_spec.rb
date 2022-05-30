require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'imageとitem_name、explanation、category_id、quality_id、payment_id、area_id、preparation_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameが41文字以上では登録できない' do
        @item.item_name = Faker::Internet.password(min_length: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1001文字以上では登録できない' do
        @item.explanation = Faker::Internet.password(min_length: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '１あア阿'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが10,000,000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'category_idが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'quality_idが未選択では登録できない' do
        @item.quality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'payment_idが未選択では登録できない' do
        @item.payment_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it 'area_idが未選択では登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'preparation_idが未選択では登録できない' do
        @item.preparation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation can't be blank")
      end
    end
  end
end
