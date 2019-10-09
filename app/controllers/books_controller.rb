class BooksController < ApplicationController
def index
    # render plain: "hello"
    # /
    @books = Book.all
end
def show
    # books/1
    @book = Book.find(params[:id])
    # if @book.image
    #     image = Cloudinary::PreloadedFile.new @book.image
    #     @public_id = image.public_id
    #     @version = image.version
    # end
end
def new
    @book = Book.new()
end
def create
    puts "XXXXXXXXXcreate"
    puts book_params

    @book = Book.new(book_params)
    # @book = Book.new(book_params.except(:image))

    # if book_params[:image]  # don't try to add image if not exist
        # image = Cloudinary::Uploader.upload(book_params[:image]) #returns json response
    # image = Cloudinary::PreloadedFile.new
    # @public_id = image.public_id
    # @version = image.version
    # @book.image = image["public_id"]
        # @book.image = Cloudinary::Utils.signed_preloaded_image image
    # end
    @book.save
    redirect_to @book
end
def edit
    @book = Book.find(params[:id])
end
def update
    @book = Book.find(params[:id])
    puts "XXXXXXXupdate"
    @book.update(book_params)
    redirect_to @book
end
def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # redirect_to books_path
    redirect_to root_path
end
private
def book_params
    params.require(:book).permit(:title,:description,:image)
end
end
