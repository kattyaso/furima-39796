require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー情報' do
    context '新規登録ができるとき'do
      it 'nickname,password,名前,名前カナ,生年月日があれば登録できる'do
      
      @user.valid?
      
      expect(@user.errors.full_messages).to be_empty
      end
    end
    context '新規登録ができないとき'do
    
      it 'nicknameが必須であること' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスが一意性であること' do
        user1 = FactoryBot.create(:user, email: 'test@example.com')
        user2 = FactoryBot.build(:user, email: 'test@example.com')
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email= 'testexample.com'  
        @user.valid?
        expect(@user.errors[:email]).to include'is invalid'
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードは、半角数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワードは、半角英字のみでは登録できないこと'do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワードは、全角文字を含むと登録できないこと'do
        @user.password = '1a1a1aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワードとパスワード（確認）が一致しない場合は登録できないこと' do
        @user.password = 'password123'
        @user.password_confirmation = 'differentpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください'
      end
      it ' お名前カナ(全角)は、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it ' お名前カナ(全角)は、名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'お名前カナ(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana 全角カタカナを使用してください'
      end
      it '生年月日が必須であること' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end

# "Email can't be blank",
#  "Password is too short (minimum is 6 characters)",
#  "Nick name can't be blank",
#  "Last name can't be blank",
#  "First name can't be blank",
#  "Last name kana can't be blank",
#  "First name kana can't be blank",
#  "Birth date can't be blank"]
