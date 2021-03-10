require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "入力項目を全て正しく入力すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nameが空だとダメ" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが被るとダメ" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが空だとダメ" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@があれば登録できる' do
      @user.email = '123@gmail.com'
      expect(@user).to be_valid
    end

    it "emailに@が無いとダメ" do
      @user.email = 'abcgmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end

    it 'passwordが空だとダメ' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは６文字以上で登録できる' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下だとダメ' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが一致しないとダメ' do
      @user.password = '123456'
      @user.password_confirmation = '123465'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end



  end  
end
