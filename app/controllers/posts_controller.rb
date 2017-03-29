class PostsController < ApplicationController
	def index
		@posts = Post.all
		@posts_by_date = @posts.group_by(&:published_on)
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		# render '/app/views/posts/index.html.erb'
		# render 'posts/index.html.erb'

	end
	def new
		@post = Post.new
	end
	
	def create
		post = Post.new(post_params)
		# This is gonna be no difference with Post.new(title: "this is a title", content: "this is the content")
		if post.save
			redirect_to post_path(post)
		else
			redirect_to new_post_path
		end
	end

	def show
		@post = Post.find(params[:id])

	
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to root_path
	end



	private
	def post_params
		params.require(:post).permit(:title, :content, :published_on)
	end

end