require 'rails_helper'

RSpec.describe "Posts", type: :request do

  # 店舗検索結果ページのテスト
  describe "GET #index" do
    subject { get(posts_path) }
    context "投稿が存在するとき" do
      before { create_list(:post, 3) }
      it "リクエストが成功する" do
        subject     
        expect(response).to have_http_status(:ok)
      end

      it "title が表示されている" do
        subject        
        expect(response.body).to include(*Post.pluck(:title))
      end
    end
  end

  # 店舗詳細ページのテスト
  describe "GET #show" do
    
    subject { get(post_path(post.id)) }
    
    context "投稿の詳細が存在するとき" do
      
      let(:post) { create(:post) }
      let(:user) { create(:user) }
      
      before do
        sign_in user
      end
      
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(:ok)       
      end

      it "店名 が表示されている" do
        subject 
        expect(response.body).to include post.title
      end

      it "郵便場号 が表示されている" do
        subject        
        expect(response.body).to include post.postalcode
      end

      it "住所１ が表示されている" do
        subject        
        expect(response.body).to include post.address1
      end
      
      it "住所２ が表示されている" do
        subject        
        expect(response.body).to include post.address2
      end

      it "電話番号 が表示されている" do
        subject        
        expect(response.body).to include post.phonenumber
      end         
    end
  end

  # 店舗新規登録ページのテスト
  describe "GET #new" do
    subject { get(new_post_path) }
    
    context "投稿が存在するとき" do
      
      it "リクエストが成功する" do
        subject     
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST #create" do

    subject { post(posts_path, params: params) }
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    context "パラメータが正常なとき" do
      
      let(:params) { { post: attributes_for(:post) } }
      
      
      it "リクエストが成功する" do
        subject 
        expect(response).to have_http_status(302)
        
      end

      it "投稿が保存される" do
        expect { subject }.to change { Post.count }.by(1)                
      end

      it "詳細ページにリダイレクトされる" do
        subject
        expect(response).to redirect_to Post.last
      end
    end

    context "パラメータが異常なとき" do
      
      let(:params) { { post: attributes_for(:post, :invalid) } }
    
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "投稿が保存されない" do
        expect { subject }.not_to change(Post, :count)
      end

      it "新規投稿ページがレンダリングされる" do
        subject
        expect(response.body).to include "投稿"
      end
    end
  end

  describe "GET #edit" do
    subject { get(edit_post_path(post.id)) }
    context "投稿が存在するとき" do
      let(:post) { create(:post) }
      let(:post_id) { post.id }
  
      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(200)
      end

      it "店名 が表示されている" do
        subject 
        expect(response.body).to include post.title
      end

      it "郵便場号 が表示されている" do
        subject        
        expect(response.body).to include post.postalcode
      end

      it "住所１ が表示されている" do
        subject        
        expect(response.body).to include post.address1
      end
      
      it "住所２ が表示されている" do
        subject        
        expect(response.body).to include post.address2
      end 

      it "電話番号 が表示されている" do
        subject        
        expect(response.body).to include post.phonenumber
      end         
    end
  end

end