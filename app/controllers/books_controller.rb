class BooksController < ApplicationController
 before_action :authenticate_user!
	def create
		@books = Book.all
		@user = User.find(current_user.id)
		@book_new= Book.new(book_params)
		@book_new.user_id = current_user.id
		if @book_new.save
			flash[:notice] ="successfully"
		    redirect_to book_path(@book_new.id)
	    else
	    render :index
        end
    end
	def index
		@books = Book.all
		@user = User.find(current_user.id)
  	    @book_new = Book.new

	end
	def show
		 @book = Book.find(params[:id])
		 @user = @book.user
		 @book_new = Book.new
	end
	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] ="successfully"
  	        redirect_to book_path(@book.id)
  	    else
  	    	render :edit
	    end
    end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
