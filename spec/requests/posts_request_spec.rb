require 'rails_helper'

RSpec.describe "Posts", type: :request do

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

  describe "GET #show" do
    # subject { get(post_path(post.id)) }
    context "投稿の詳細が存在するとき" do
      # before { create_list(:post, 3) }
      
      it "リクエストが成功する" do
        # post = create(:post)

        # get(post_path(post.id))
        # expect(response).to have_http_status(:ok)
      end

      it "電話番号 が表示されている" do
        # subject        
        # expect(response.body).to include(*Post.pluck(:title))
      end

      it "郵便番号 が表示されている" do
        # subject        
        # expect(response.body).to include(*Post.pluck(:phonenumber))
      end

      it "店名 が表示されている" do
        # subject        
        # expect(response.body).to include(*Post.pluck(:postalcode))
      end

    end
  end
end