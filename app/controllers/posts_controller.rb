class PostsController < ApplicationController
	before_action :authenticate_user!, only:[:new, :show, :create, :destroy]

	def about
	end

	def  newS
		@post = Post.new
		@post.photos.build
	end

	def create
		@post = Post.new(post_params)
		if @post.photos.present?
			@post.save
			redirect_to root_path
			flash[:notice]="投稿が保存されました"
		else
			redirect_to root_path
			flash[:alert]="投稿に失敗しました"
		end
	end

	def index
		@posts = Post.limit(10)
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	def destroy
		@post = Post.find_by(id: params[:id])
		if @post.user == current_user
		   @post.destroy
		   flash[:notice]="投稿を削除しました"
		else
			flash[:notice]="エラーです"
		end
		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
		end

end
