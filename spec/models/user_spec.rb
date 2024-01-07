require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録'do
    it 'nicknameが必須であること'do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end
    it 'メールアドレスが必須であること'do
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
    it "メールアドレスは、@を含む必要があること" do
      user = FactoryBot.build(:user, email: "testexample.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
    it 'パスワードが必須であること'do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードは、6文字以上での入力が必須であること"do
      @user.password = "1"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "パスワードは、半角英数字混合での入力が必須であること"do
      @user.password ="123456"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードとパスワード（確認）が一致しない場合は登録できないこと' do
      @user.password = 'password123'
      @user.password_confirmation = 'differentpassword'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end