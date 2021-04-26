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
        
        binding.pry
                
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