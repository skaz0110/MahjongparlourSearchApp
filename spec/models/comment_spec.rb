require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    subject { comment.valid? }
    context 'データが条件を満たすとき' do
      let(:comment) { build(:comment) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
    context 'コメント が空のとき' do
      let(:comment) { build(:comment, content: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(comment.errors.messages[:content]).to include 'を入力してください'
      end
    end
    context 'コメント が101文字以上のとき' do
      let(:comment) { build(:comment, content: 'a' * 101) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(comment.errors.messages[:content]).to include 'は100文字以内で入力してください'
      end
    end
  end
end
