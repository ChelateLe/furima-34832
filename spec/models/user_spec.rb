require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "入力項目を全て正しく入力すれば登録できること" do
      expect(@user).to be_valid
    end
  end  
end
