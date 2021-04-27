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

  describe 'PATCH #update' do
    subject { patch(post_path(post.id), params: params) }
    let(:post) { create(:post) }

    context 'パラメータが正常な場合' do
      let(:params) { { post: attributes_for(:post) } }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it '店名 が更新される' do
        origin_title = post.title
        new_title = params[:post][:title]
        expect { subject }.to change { post.reload.title }.from(origin_title).to(new_title)
      end

      it '郵便場号 が更新される' do
        origin_postalcode = post.postalcode
        new_postalcode = params[:post][:postalcode]
        expect { subject }.to change { post.reload.postalcode }.from(origin_postalcode).to(new_postalcode)
      end

      it '住所１ が更新される' do
        origin_address1 = post.address1
        new_address1 = params[:post][:address1]
        expect { subject }.to change { post.reload.address1 }.from(origin_address1).to(new_address1)
      end

      it '住所２ が更新される' do
        origin_address2 = post.address2
        new_address2 = params[:post][:address2]
        expect { subject }.to change { post.reload.address2 }.from(origin_address2).to(new_address2)
      end

      it '電話番号 が更新される' do
        origin_phonenumber = post.phonenumber
        new_phonenumber = params[:post][:phonenumber]
        expect { subject }.to change { post.reload.phonenumber }.from(origin_phonenumber).to(new_phonenumber)
      end

      it '詳細ページにリダイレクトされる' do
        subject
        expect(response).to redirect_to Post.last
      end
    end

    context 'パラメータが異常な場合' do
      let(:params) { { post: attributes_for(:post, :invalid) } }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(200)
      end

      it '店名 が更新されない' do
        expect { subject }.not_to change(post.reload, :title)
      end
      
      it '郵便番号 が更新されない' do
        expect { subject }.not_to change(post.reload, :postalcode)
      end

      it '住所１ が更新されない' do
        expect { subject }.not_to change(post.reload, :address1)
      end

      it '住所２ が更新されない' do
        expect { subject }.not_to change(post.reload, :address2)
      end

      it '電話番号 が更新されない' do
        expect { subject }.not_to change(post.reload, :phonenumber)
      end

      it '編集ページがレンダリングされる' do
        subject
        expect(response.body).to include '情報修正'
      end
    end
  end

end