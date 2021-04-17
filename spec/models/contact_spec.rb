require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "バリデーション" do
    subject { contact.valid? }
    context "データが条件を満たすとき" do
      let(:contact) { build(:contact) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "name が空のとき" do
      let(:contact) { build(:contact, name: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:name]).to include "を入力してください"
      end
    end
    context "name が21文字以上のとき" do
      let(:contact) { build(:contact, name: "a"*21) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:name]).to include "は20文字以内で入力してください"
      end
    end
    context "email が空のとき" do
      let(:contact) { build(:contact, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:email]).to include "は不正な値です"
      end
    end
    context "email が256文字以上のとき" do
      let(:contact) { build(:contact, email: "a"*256) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:email]).to include "は255文字以内で入力してください"
      end
    end
    context "email が アルファベット･英数字 のみのとき" do
      let(:contact) { build(:contact, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:email]).to include "は不正な値です"
      end
    end
    context "content が空のとき" do
      let(:contact) { build(:contact, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:content]).to include "を入力してください"
      end
    end
    context "content が空のとき" do
      let(:contact) { build(:contact, content: "a"*501) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(contact.errors.messages[:content]).to include "は500文字以内で入力してください"
      end
    end
  end
  
end