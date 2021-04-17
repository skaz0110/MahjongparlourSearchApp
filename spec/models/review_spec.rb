require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "バリデーション" do
    subject { review.valid? }
    context "データが条件を満たすとき" do
      let(:review) { build(:review) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "コメント が空のとき" do
      let(:review) { build(:review, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(review.errors.messages[:content]).to include "を入力してください"
      end
    end
    context "コメント が201文字以上のとき" do
      let(:review) { build(:review, content: "a"*201) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(review.errors.messages[:content]).to include "は200文字以内で入力してください"
      end
    end
    context "星が空のとき" do
      let(:review) { build(:review, star: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(review.errors.messages[:star]).to include "を入力してください"
      end
    end
  end
  
end