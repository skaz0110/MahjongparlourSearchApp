require 'rails_helper'

RSpec.describe "Likes", type: :request do

  describe "GET #index" do
    subject { get(likes_path) }
    
    context "いいねした投稿が存在するとき" do
      
      let(:post) { create_list(:post,3) }
      let(:user) { create(:user) }

      before do
        sign_in user
        
        create(:like,user: user, post: post.first)
        create(:like,user: user, post: post.second)
        create(:like,user: user, post: post.last)
      end

      it "リクエストが成功する" do
        subject     
        expect(response).to have_http_status(:ok)
      end

      it "post.title が表示されている" do
        subject        
        expect(response.body).to include(*Post.pluck(:title)) 
      end
    end
  end

  #TODO 非同期のテストを実施
  # describe "POST #create" do
      
  #   let(:parapost) { create(:post) }
  #   let(:user) { create(:user) } 
  #   let(:like) { create(:like, user_id: user.id, post_id: parapost.id) }

  #   before do
  #     sign_in user
  #   end

  #   context "パラメータが正常なとき" do

  #     it "リクエストが成功する" do
  #       post :create, format: :json,
  #       params: { post_id: parapost.id, user_id: user.id }
  #       expect(response.content_type).to eq "application/json"      
  #     end

  #     it "コメントが保存される" do
  #       expect { subject }.to change { Like.count }.by(1)
  #     end

  #     it "詳細ページにリダイレクトされる" do
  #       subject
  #       expect(response).to redirect_to Like.last
  #     end
  #   end

  #   context "パラメータが異常なとき" do

  #     let(:params) { { comment: attributes_for(:comment,:commentinvalid) } }

  #     it "リクエストが成功する" do
  #       subject 
  #       expect(response).to have_http_status(302)      
  #     end

  #     it "コメントが保存されない" do
  #       expect { subject }.not_to change(Comment, :count)
  #     end

  #     it "詳細ページがレンダリングされる" do
  #       subject
  #       expect(response.body).to include "You are being"
  #     end
  #   end
  # end

  # describe "POST #create" do
  # end
  
end