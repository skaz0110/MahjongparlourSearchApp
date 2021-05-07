require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  describe 'GET #index' do
    subject { get(post_reviews_path(post.id)) }
    context 'レビューが存在するとき' do
      let(:post) { create(:post) }
      let(:user) { create(:user) }
      before do
        create_list(:review, 3, post: post)
        sign_in user
      end

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'content が表示されている' do
        subject
        expect(response.body).to include(*Review.pluck(:content))
      end
    end
  end

  describe 'GET #new' do
    subject { get(new_post_review_path(post.id)) }

    let(:post) { create(:post) }
    let(:user) { create(:user) }
    before do
      sign_in user
    end

    context 'レビューが存在するとき' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    let(:parapost) { create(:post) }
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    context 'パラメータが正常なとき' do
      subject do
        post(post_reviews_path(parapost.id),
             params: { review: { content: '初心者も入り安いと思う！', star: 4.5, post_id: parapost.id } })
      end

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'レビューが保存される' do
        expect { subject }.to change { Review.count }.by(1)
      end

      it '口コミ一覧にリダイレクトされる' do
        subject
        expect(response).to redirect_to post_reviews_path(parapost.id)
      end
    end

    context 'パラメータが異常なとき' do
      subject do
        post(post_reviews_path(parapost.id), params: { review: { content: nil, star: 4.5, post_id: parapost.id } })
      end

      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(200)
      end

      it 'レビューが保存されない' do
        expect { subject }.not_to change(Review, :count)
      end

      it 'レビュー投稿ページがレンダリングされる' do
        subject
        expect(response.body).to include '口コミ投稿'
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete(post_review_path(post.id, review.id)) }

    let!(:post) { create(:post) }
    let!(:review) { create(:review, post: post) }
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    context 'パラメータが正常な場合' do
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(302)
      end

      it 'レビューが削除される' do
        expect { subject }.to change(Review, :count).by(-1)
      end

      it 'レビュー一覧にリダイレクトすること' do
        subject
        expect(response).to redirect_to post_reviews_path(post.id)
      end
    end
  end
end
