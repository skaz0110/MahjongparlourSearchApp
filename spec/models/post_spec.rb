require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーション' do
    subject { post.valid? }
    context 'データが条件を満たすとき' do
      let(:post) { build(:post) }
      it 'postデータが保存できる' do
        expect(subject).to eq true
      end
    end
    context '店舗名が３１文字以上の時' do
      let(:post) { build(:post, title: 'a' * 31) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:title]).to include 'は30文字以内で入力してください'
      end
    end
    context '店舗名が空の時' do
      let(:post) { build(:post, title: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:title]).to include 'を入力してください'
      end
    end
    context '郵便番号が○○○○-○○○○の時' do
      let(:post) { build(:post, postalcode: '1111-1111') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:postalcode]).to include 'は不正な値です'
      end
    end
    context '郵便番号が○○○-○○○の時' do
      let(:post) { build(:post, postalcode: '111-111') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:postalcode]).to include 'は不正な値です'
      end
    end
    context '郵便番号が空の時' do
      let(:post) { build(:post, postalcode: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:postalcode]).to include 'を入力してください'
      end
    end
    context '電話番号が040から始まる' do
      let(:post) { build(:post, phonenumber: '040-1111-2222') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:phonenumber]).to include 'は不正な値です'
      end
    end
    context '電話番号が桁数オーバーの時' do
      let(:post) { build(:post, phonenumber: '080-5555-11111') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:phonenumber]).to include 'は不正な値です'
      end
    end
    context '電話番号の桁数不足の時' do
      let(:post) { build(:post, phonenumber: '090-111-333') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:phonenumber]).to include 'は不正な値です'
      end
    end
    context '電話番号が不正な組み合わせ' do
      let(:post) { build(:post, phonenumber: '8564398675') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:phonenumber]).to include 'は不正な値です'
      end
    end
    context '電話番号が空の時' do
      let(:post) { build(:post, phonenumber: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:phonenumber]).to include 'を入力してください'
      end
    end
    context '都道府県コードが空の場合' do
      let(:post) { build(:post, prefecturecode: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:prefecturecode]).to include 'を入力してください'
      end
    end
    context '都道府県コードが０の時' do
      let(:post) { build(:post, prefecturecode: 0) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:prefecturecode]).to include 'は1以上の値にしてください'
      end
    end
    context '都道府県コードが４８以上の時' do
      let(:post) { build(:post, prefecturecode: 48) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:prefecturecode]).to include 'は47以下の値にしてください'
      end
    end
    context '都道府県コードが全角数値の時' do
      let(:post) { build(:post, prefecturecode: '４５') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:prefecturecode]).to include 'は数値で入力してください'
      end
    end
    context '住所１が空の場合' do
      let(:post) { build(:post, address1: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:address1]).to include 'を入力してください'
      end
    end
    context '住所１が２０文字以上の場合' do
      let(:post) { build(:post, address1: 'あ' * 21) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:address1]).to include 'は20文字以内で入力してください'
      end
    end
    context '住所2が空の場合' do
      let(:post) { build(:post, address2: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:address2]).to include 'を入力してください'
      end
    end
    context '住所2が２０文字以上の場合' do
      let(:post) { build(:post, address2: 'あ' * 21) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(post.errors.messages[:address2]).to include 'は20文字以内で入力してください'
      end
    end
  end

  context 'ユーザーが削除されたとき' do
    subject { user.destroy }

    let(:user) { create(:user) }
    before do
      create_list(:post, 2, user: user)
      create(:post)
    end
    it 'そのユーザーの投稿も削除される' do
      expect { subject }.to change { user.posts.count }.by(-2)
    end
  end
end
