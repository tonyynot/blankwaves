class AlbumsController < ApplicationController
	before_action :find_album, only: [:show, :edit, :update, :destroy]

	def index
		@albums = Album.all.order("created_at DESC")
	end

	def show
	end

	def new
		@album = current_user.albums.build 
	end

	def create
		@album = current_user.albums.build(album_params)
		if @album.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @album.update(album_params)
			redirect_to album_path(@album)
		else
			render 'edit'
		end 
	end

	def destroy
		if @book.destroy
			redirect_to root_path
		end
	end

private

	def album_params
		params.require(:album).permit(:title, :description, :artist)
	end

	def find_album
		@album = Album.find(params[:id])
	end

end
