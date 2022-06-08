require 'rails_helper'

RSpec.describe ItemBuyForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_buy_form = FactoryBot.build(:item_buy_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'クレジットカード情報と配送先住所が存在すれば購入できる' do
        expect(@item_buy_form).to be_valid
      end
      it '建物名がなくても購入できる' do
        @item_buy_form.building = nil
        expect(@item_buy_form).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'クレジットカード情報が空では購入できない' do
        @item_buy_form.token = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalが空では購入できない' do
        @item_buy_form.postal = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalが「3桁ハイフン4桁」でないと購入できない' do
        @item_buy_form.postal = '1112222'
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include('Postal is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'area_idが未選択では購入できない' do
        @item_buy_form.area_id = '1'
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'citiesが空では購入できない' do
        @item_buy_form.cities = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("Cities can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @item_buy_form.house_number = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephoneが空では購入できない' do
        @item_buy_form.telephone = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが10桁以下だと購入できない' do
        @item_buy_form.telephone = '123456789'
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include('Telephone number is too short')
      end
      it 'telephoneが11桁以上だと購入できない' do
        @item_buy_form.telephone = '123456789012'
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include('Telephone number is too short')
      end
      it 'telephoneが半角数値のみでないと購入できない' do
        @item_buy_form.telephone = '１あア阿-ー'
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include('Telephone number is too short')
      end
      it 'userが紐付いていないと購入できない' do
        @item_buy_form.user_id = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @item_buy_form.item_id = nil
        @item_buy_form.valid?
        expect(@item_buy_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
