require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、gender_id、birthdayが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれると、登録できる' do
        @user.email = 'aaa@aaa.com'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合の6文字以上で、passwordとpassword_confirmationが一致すると、登録できる' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まない場合は、登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複している場合は、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと、登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英字のみだと、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが半角数字のみだと、登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが5文字以下だと、登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では、登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationがpasswordと不一致では、登録できない' do
        @user.password              = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'gender_idが選択されていないと登録できない' do
        @user.gender_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender is not a number")
      end
      it 'birthdayが空だと、登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
