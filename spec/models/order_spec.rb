require 'rails_helper'

describe Order do
  before do  
    @order = FactoryBot.build(:item_order)
  end

  describe '商品の購入' do
    context '購入がうまくいくとき' do

      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeが空だと購入できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "area_idが'--'だと購入できない" do 
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 0")
      end
      it 'house_numberが空だと購入できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが11桁以内でないと購入できないこと' do
        @order.phone_number = 123456123456
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end  
      it 'tokenが空だと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
