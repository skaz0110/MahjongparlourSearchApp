require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET #index' do
    subject { get(post_comments_path(post.id)) }

    context 'コメントが存在するとき' do
      let(:post) { create(:post) }
      let(:user) { create(:user) }

      before do
        create_list(:comment, 3, user: user, post: post)
        sign_in user
      end

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'content が表示されている' do
        subject
        expect(response.body).to include(*Comment.pluck(:content))
      end
    end
  end

  describe 'POST #create' do
    subject { post(post_comments_path(posttest.id), params: params) }
    let(:posttest) { create(:post) }
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    context 'パラメータが正常なとき' do
      let(:params) { { comment: attributes_for(:comment) } }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'コメントが保存される' do
        expect { subject }.to change { Comment.count }.by(0)
      end

      it '詳細ページにリダイレクトされる' do
        subject
        expect(response).to redirect_to Comment.last
      end
    end

    context 'パラメータが異常なとき' do
      let(:params) { { comment: attributes_for(:comment, :commentinvalid) } }

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'コメントが保存されない' do
        expect { subject }.not_to change(Comment, :count)
      end

      it '詳細ページがレンダリングされる' do
        subject
        expect(response.body).to include 'You are being'
      end
    end
  end
end
