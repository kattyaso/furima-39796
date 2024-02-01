require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order =FactoryBot.build(:order)
  end
  describe '配送先情報' do
      context '商品が購入できるとき'do
        it '適切な入力があれば出品できる'do
          expect(@order).to be_valid
        end
      end
      context '商品が購入できないとき'do
        it '郵便番号が記入されていないとき'do
          @order.postcode = ''
          @order.valid?
          expect(@order.errors.full_messages).to include "Postcode can't be blank"
        end
      end
  end
end
