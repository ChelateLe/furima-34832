require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "入力項目を全て正しく入力すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nicknameが空だとダメ" do
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

    it 'passwordは６文字以上かつ半角英数字混合で登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下だとダメ' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが数字だけだとダメ' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordがアルファベットだけだとダメ' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが一致しないとダメ' do
      @user.password = '123456'
      @user.password_confirmation = '123465'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "苗字が空だとダメ" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "苗字が半角だとダメ" do
      @user.family_name = 'bob'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "名前が空だとダメ" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名前が半角だとダメ" do
      @user.first_name = 'bob'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "名前（カナ）が空だとダメ" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "名前（カナ）がひらがなだとダメ" do
      @user.first_name_kana = 'こんにちは'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "名前（カナ）が漢字だとダメ" do
      @user.first_name_kana = '今日'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "名前（カナ）が英語だとダメ" do
      @user.first_name_kana = 'bob'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "名前（カナ）がカタカナなら成功" do
      @user.first_name_kana = 'ゴロウ'
      expect(@user).to be_valid
    end

    it "苗字（カナ）が空だとダメ" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "苗字（カナ）がひらがなだとダメ" do
      @user.family_name_kana = 'こんにちは'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "苗字（カナ）が漢字だとダメ" do
      @user.family_name_kana = '今日'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "名前（カナ）が英語だとダメ" do
      @user.family_name_kana = 'bob'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "名前（カナ）がカタカナなら成功" do
      @user.family_name_kana = 'ゴロウ'
      expect(@user).to be_valid
    end

    it "birth_dateが空だとダメ" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

  end  
end
