require 'rails_helper'

RSpec.describe "Contacts", type: :request do

  describe "GET #new" do
    subject { get(new_contacts_path) }
    
    context "お問い合わせページが表示されている" do
    
      let(:user) { create(:user) }

      before do
        sign_in user
      end
      it "リクエストが成功する" do
        subject     
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST #create" do
    
    subject { post(contacts_path, params: params) }

    context "パラメータが正常なとき" do

      let(:params) { { contact: attributes_for(:contact) } }
      let(:user) { create(:user) }

      before do
        sign_in user
      end
      
      it "リクエストが成功する" do
        subject 
        expect(response).to have_http_status(302)      
      end

      it "お問い合わせが送信される" do
        expect { subject }.to change { Contact.count }.by(1)
      end

      it "thanksページにリダイレクトされる" do
        subject
        expect(response.body).to include "thanks"
      end
    end

    context "パラメータが異常なとき" do

      let(:params) { { contact: attributes_for(:contact, :contactinvalid) } }
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "リクエストが成功する" do
        subject 
        expect(response).to have_http_status(200)      
      end

      it "お問い合わせが送信されない" do
        expect { subject }.not_to change(Contact, :count)
      end

      it "お問い合わせページがレンダリングされる" do
        subject
        expect(response.body).to include "お問い合わせ"
      end
    end
  end
  
end