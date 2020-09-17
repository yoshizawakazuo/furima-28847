require 'rails_helper'
describe Item do
  before do
    
    @item = FactoryBot.build(:item)
    @user = FactoryBot.create(:user)
    @item.user_id = @user.id
    
    
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "image、name,info,items_status,preparation_day,postage_payer,area,category,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      
    end

    context '新規登録がうまくいかないとき' do
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと登録できない" do 
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include( "Name can't be blank")
      end

      it "infoが空だと登録できない" do 
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

     

      it "items_statusが'--'だと登録できない" do 
        @item.items_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Items status must be other than 0")
      end

    

      it "prepration_day_idが'--'だと登録できない" do 
        @item.preparation_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day must be other than 0")
      end

      

      it "postage_payer_idが'--'だと登録できない" do 
        @item.postage_payer_id = 0

        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 0")
      end
      
      
      it "area_idが'--'だと登録できない" do 
        @item.area_id = 0

        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end

      
      it "category_idが'--'だと登録できない" do
        @item.category_id = 0

        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数字以外だと登録できない" do 
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが300~9999999の範囲外(299以下）では登録できない" do 
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが300~9999999の範囲外(10000000以上）では登録できない" do 
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end