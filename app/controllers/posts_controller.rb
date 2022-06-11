class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    # 降順
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id:params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id:@post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    # nameで指定している値を取得してDBに保存
    @post = Post.new(
      content:params[:content],
      user_id:@current_user.id
    )
    if @post.save
      # 保存成功時のメッセージ
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      # 更新成功時のメッセージ
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    # 削除成功時のメッセージ
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  # 投稿したユーザーとログインユーザーが同一か確認
  def ensure_correct_user
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
