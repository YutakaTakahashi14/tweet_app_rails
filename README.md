# README

■Rubyの開発環境構築（Windows）

 ①Rubyのインストール  
  
　https://rubyinstaller.org/downloads/

 ②Rubyインストールできたか確認  

　Ruby -v  
 
■Ruby on Railsの環境構築

 ※前提：Rubyの開発環境構築（Windows）が終了している

 ①SQLite3のインストール

　https://sqlite.org/index.html  
　ダウンロードしたフォルダの中にある、「sqlite3.exe」というファイルを「C:?Ruby○○-x64?bin」へコピー。

 ②Ruby on Railsのインストール  

　gem install rails -v "バージョン"    
　rails -v  
 
 ■Railsアプリケーションの作成

　rails new アプリケーション名  
　例：rails new sample_app -G  
　
　※①失敗時の対応  
　　
　　cd sample_app  
　　ridk exec pacman -S mingw-w64-x86_64-sqlite3  
　　bundle install  
　　　
　　②①で"tzinfo-data"のエラーが出た場合  
     Gemfileのplatforms: %i[ mingw mswin x64_mingw jruby ]というオプションをコメントアウト  
　　
 ■ローカルでRailsサーバを立てる
  
 * 「sample_app」に移動してrails s
 * localhost:3000をブラウザで叩く

 ■ページ生成　※ビュー、コントローラー、ルーディングファイル生成

 * rails generate controller （コントローラー名） （アクション名）
 * （例）トップページを生成したい場合：rails generate controller home top
　
 ■画像の配置場所
　
 * publicフォルダ推奨：画像名の指定で簡単に表示可能
  
 ■cannot load such file -- sasscのエラー対処
  
 * Gemfileのgem "sassc-rails"のコメントアウトを削除してbundle install
 * rails7.00以前はこのgemが環境構築の際に自動でinstallされていたが、7.00以降では標準でインストールされない
  
 ■JS追加
  
　<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  
 ■コメントアウト
  
 * <%#　コメントアウト文 %>
　
 ■マイグレーション＆モデルファイル作成＆実行
  
 * rails g model （モデル名） （カラム名）:（型）  
 * （例）rails g model Post content:text
　
　rails db:migrate
　
　※マイグレーション実行まで行わないとアクセス時にエラーになる
　※マイグレーションファイルのみを作成するには「rails g migration」
  
 ■JS・画像ファイル

 * JSファイルはRails6からapp/javascript/packs/application.jsに配置
 * 画像ファイルはpublicフォルダ配下に配置
　
