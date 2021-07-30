class CommentsController < ApplicationController

	before_action :find_post
	before_action :find_comment, only: [:destroy, :edit, :update]

	#Cria comentario atraves do POST
	def create
		@comment = @post.comments.create(params[:comment].permit(:body))
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	#Destroi comentario e rediciona para mesma pagina

	def destroy
		@comment.destroy
		redirect_to post_path(@post)
	end

	#Edita comentario e rediciona para mesma pagina
	def edit	
	end

	#Atualiza comentario e rediciona para mesma pagina
	def update
		if @comment.update(params[:comment].permit(:body))
			redirect_to post_path(@post)
			
		else
			render 'edit'
		end
	end

	private
	#Rediciona e puxa os paramentros POST
	def find_post
		@post = Post.find(params[:post_id])
	end
	#Rediciona e puxa os paramentros Comment
	def find_comment
		@comment = @post.comments.find(params[:id])
	end

end
