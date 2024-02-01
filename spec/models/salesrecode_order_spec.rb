require 'rails_helper'

RSpec.describe SalesrecodeOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    @salesrecode_order =FactoryBot.build(:salesrecode_order,user_id: user.id)
  end
  describe '配送先情報' do
      context '商品が購入できるとき'do
        it '適切な入力があれば購入できる'do
          expect(@salesrecode_order).to be_valid
        end
        it '建物の名前がなくても購入できる'do
          @salesrecode_order.building = ''
          expect(@salesrecode_order).to be_valid
        end
      end
      context '商品が購入できないとき'do
        it '郵便番号が記入されていないとき'do
          @salesrecode_order.postcode = ''
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "Postcode can't be blank"
        end
        it '郵便番号は3桁-4桁の半角文字列のみ保存可能'do
          @salesrecode_order.postcode = '1234567'
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
        end
        it '都道府県がなければ保存できない' do
          @salesrecode_order.origin_address_id = '1'
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "Origin address can't be blank"
        end
          it '市町村名がないと保存できない' do
          @salesrecode_order.city = ''
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "City can't be blank"
        end
          it '番地がないと保存できない' do
          @salesrecode_order.address = ''
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "Address can't be blank"
        end
          it '電話番号がないと保存できない'do
          @salesrecode_order.phone_number = ''
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "Phone number can't be blank"
        end
          it '電話番号は10桁か11桁でないと保存できない'do
          @salesrecode_order.phone_number = '123456789'
          @salesrecode_order.valid?
          expect(@salesrecode_order.errors.full_messages).to include "Phone number must be 10 to 11 digits"
        end

      end
  end
end
