class BlogsController < ApplicationController
def index
@blogs= Blog.all.order("created_at DESC")
end

def new
	@blog=Blog.new
end
def create
	@blog=Blog.new(post_params)
	if @blog.save
		redirect_to @blog
	else
		render 'new'
	end
end	

def show
	@blog= Blog.find(params[:id])
end

def destroy
	@blog= Blog.find(params[:id])
	@blog.destroy
end
def edit
	@blog= Blog.find(params[:id])
end
def update
	@blog= Blog.find(params[:id])
	if @blog.update(post_params)
	redirect_to @blog
else
	render 'edit'
	end
end
	private 
	
	def post_params
		params.require(:blog).permit(:title, :content)
	end

end
