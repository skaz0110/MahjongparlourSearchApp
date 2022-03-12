# 雀荘イキタイ
<img width="300" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/118657679-a61b3100-b826-11eb-931f-a7fdf72f9f62.png">


麻雀「初心者」のために特化した雀荘クチコミサービスです。

＊現在停止中
URL： [https://mahjongparlour-go.com](http://mahjongparlour-go.com/)

ゲストユーザーログインを用意してあります。

# アプリ概要
* 雀荘を探す

   まずは気になる雀荘を探す
* レビューを見る

   自分に合いそう雀荘がないか検討することができる
* 仲間作り

　　コメントやフォロー機能(実装予定)を利用することでコミュニティが広がる
# なぜ作ろうと思ったのか？
<h3>麻雀を普及させたい！業界の低迷に貢献したい！という想いから開発しました。</h3>
麻雀のプレイ人口は年々減少の一途を辿っています。

その原因の一つとして若年層の支持の弱さが挙げられます。

ではなぜ若年層のプレイヤーが増えないのか？<br>
理由としてはおおよそこの辺りです。

・怖いイメージ、悪いイメージが強い<br>
・ルールを覚えるのが難しそう<br>
・そもそもプレイできる人が集まらない<br>

<h3>では、この問題をサービスを通して解決できないのか？そう考えたのが始まりです。</h3>

麻雀はプレイヤーが４人必要な上、そこそこできる人を身内で集めることが難しいです。<br>
必然的にお店に行くほか選択肢がないのです。<br>

しかし、初心者の段階で雀荘に行くなんて怖いものです。ほとんどの人が行けないのが現実です。<br>
この一連の流れにより初心者期間で辞めていく人がほとんどです。これは始めたての自分も感じたことです。<br>

<h3>麻雀というゲームは、初期段階を脱出することに対してあまりにハードルが高いのです。</h3>
<p>では、雀荘の敷居を下げることができれば、この流れを改善できるのではないかと考えました。</p>
初心者の肩身が狭いお店が多いのも事実ですが、初心者を歓迎しているお店も大いにあります。<br>
それらの情報を事前に知ることができれば、初心者でも雀荘に行くという選択肢が取れるのはないでしょうか。<br>
<p>
<p>そのような背景から、情報共有プラットフォームとして今回のサービスを開発しました。</p>

# 使用画面イメージ
<strong>【トップページ】</strong>
<img width="900" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/119650333-aaff6680-be5e-11eb-8cee-0731635b420f.png">
<img width="900" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/119651827-5b219f00-be60-11eb-971d-d1cf8f812145.png">

<strong>【店舗ページ】</strong>

<img width="600" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/119650731-1f3a0a00-be5f-11eb-8a1c-2c02fdb3b0dc.png">
<img width="600" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/119650744-22cd9100-be5f-11eb-93ce-f3d1a6aa5df0.png">

<strong>【ランキングページ】</strong>

<img width="900" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/119650769-26f9ae80-be5f-11eb-84ec-faeb69d397fc.png">



# 使用技術
## フロントエンド
 * HTML/CSS
 * JavaScript, jQuery
 * Bootstrap 4.6.0
## バックエンド
 * Ruby 2.7.2
 * Rails 6.1.1
## 開発環境
 * Docker 20.10.5
 * docker-compose 1.28.5
 * PostgreSQL 13.1
## 本番環境
 * AWS（EC2, RDS, VPC, Route53, ACM, ALB, S3, IAM, CloudFront）
 * Nginx
 * Puma
 * Capistrano
 * PostgreSQL 13.1
## テスト
 * Rspec(単体・統合)
## その他使用技術
 * TwitterAPI
 * 非同期通信
 * コードの自動修正(Rubocop)
# 機能一覧
 * ログイン関連(deviceを使用)
    * ログアウト、ログイン、新規会員登録、アカウント編集
    * ゲストユーザーログイン
    * Twitter認証ログイン(omniauth-twitterを使用)
 * お問い合わせ機能(Action Mailerを使用)
    * 設定のメールアドレスに送信
 * スクレイピング機能(mechanizeを使用)
    * 麻雀のニュースを取得してホーム画面に表示 
 * 検索機能(ransackを使用)
    * 店舗の検索(キーワード検索・都道府県検索)
 * いいね機能(ajax)
    * 店舗へのいいね
    * いいねした一覧の表示
 * 画像付き店舗登録機能(carrierwaveを使用)
    * 店舗の登録、表示、編集
 * 口コミ投稿機能(jQuery/raty.js)
    * 店舗に星５評価で口コミ投稿
    * みんなの口コミ投稿を表示
    * 店舗の平均星評価を表示
 * 管理者機能(activeadminを使用)
 * コメント機能
    * 店舗へのコメント
 * フラッシュメッセージ表示機能
    * 投稿、編集、削除、ログイン、ログアウト時にフラッシュメッセージを表示
 * ページネーション機能(kaminariを使用)
    * 検索一覧、コメント一覧、口コミ一覧 
 * レスポンシブ対応(*順次追加中) 
 
# ER図
<img width="600" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/118650987-ffcc2d00-b81f-11eb-9857-dd312b0c2f23.png">

# インフラ構成図
<img width="600" alt="スクリーンショット 2021-05-15 16 29 04" src="https://user-images.githubusercontent.com/72676401/119150145-217c1d00-ba89-11eb-8bd9-3ca7d90df36d.png">
