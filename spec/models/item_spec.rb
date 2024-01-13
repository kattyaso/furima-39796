require 'rails_helper'

  RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品出品機能' do
      context '商品出品ができるとき' do
        it '適切な入力があれば出品できる' do
          expect(@item).to be_valid
        end
      end
      
      context '商品出品ができないとき' do
         it 'ログアウト状態であればログインページへ遷移される' do

         end
         it '商品画像がないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
         end
         it '商品名がないと出品できない' do
          @item.item = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Item can't be blank"
         end
         it '商品の説明がないと出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Description can't be blank"
         end
         it 'カテゴリーの情報が必須であること' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
         end

         it '商品の状態の情報がないと出品できない' do
          @item.sales_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Sales status can't be blank"
         end
         it '配送料の負担の情報がないと出品できない' do
          @item.fee_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Fee status can't be blank"
         end
         it '配送元の地域の情報がないと出品できない' do
          @item.origin_address_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Origin address can't be blank"
         end
         it '発送までの日数の情報がないと出品できない'do
         @item.schedule_delivery_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Schedule delivery can't be blank"
         end
         it '価格の情報がないと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
         end
         it '価格は300以下では出品できない' do
          @item.price ='299'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
         end
         it '価格は10,000,000円以上では出品できない' do
          @item.price ='10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include  "Price must be less than or equal to 9999999"
         end
         it '価格は全角数値では保存できない' do
          @item.price = '１００００' 
            @item.valid?
            expect(@item.errors.full_messages).to include  "Price is not a number"
         end



      end
  end
end
