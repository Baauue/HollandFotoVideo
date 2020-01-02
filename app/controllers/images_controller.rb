class ImagesController < ApplicationController
before_action :authenticate_user!
	def index
    
	end

  def create
    image = Image.create image_params
    if image.valid?
      flash[:success] = 'De foto is toegevoegd'
    else
      flash[:danger] = image.errors
    end
    rb
  end

  def show
    @image = Image.all
  end

  def pictures
    @image = Image.all
  end

  def edit
    @image = Image.find params[:id]
  end

  def update
    @image = Image.find params[:id]
    @image.update image_params
    flash[:success] = 'Naam opgeslagen'
    rb
  end

  def destroy
    image = Image.find params[:id]
    image.destroy
    rb
  end

  private
  def image_params
    params.require(:image).permit(:file, :title)
  end
end
