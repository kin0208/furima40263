require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_delivery).to be_valid
      end
      
      it 'building_nameは空でも保存できる' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      
      it '都道府県が未選択だと保存できない' do
        @order_delivery.prefecture_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県の選択が---だと保存できない' do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空だと保存できない' do
        @order_delivery.street_address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数値でないと保存できない' do
        @order_delivery.phone_number = '０８０１２３４１２３４'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid. Input only numbers")
      end

      it 'phone_numberが10桁以上11桁以内でないと保存できない' do
        @order_delivery.phone_number = '080'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short")
      end

      it 'tokenが空では登録できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
