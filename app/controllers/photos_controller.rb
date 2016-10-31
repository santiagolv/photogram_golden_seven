class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end
  def new_form
    render ("/photo_new.html.erb")
  end
  def show
    @photo_id=params["id"].to_i
    render ("/photo_details.html.erb")
  end
  def create_row
    i = Photo.new
    i.source = params["the_source"]
    i.caption = params["the_caption"]
    i.save
    redirect_to("http://localhost:3000/photos")
  end
  def destroy
    i=Photo.find(params["id"].to_i)
    i.destroy
    redirect_to("http://localhost:3000/photos")
  end
  def edit_form
    @photo_id=params["id"].to_i
    @photo_source = Photo.where(:id=>@photo_id).pluck(:source)
    @photo_caption =Photo.where(:id=>@photo_id).pluck(:caption)
    render ("/photo_edit.html.erb")

  end

  def update_row
    i = Photo.find(params["id"].to_i)
    i.source=params["the_source"]
    i.caption=params["the_caption"]
    i.save
    redirect_to("http://localhost:3000/photos")
  end

end
