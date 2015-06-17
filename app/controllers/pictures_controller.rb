class PicturesController < ApplicationController
 def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new picture_params

    if @picture.save
      redirect_to pictures_path, flash: {success: "Picture added to list!"}
    else
      flash[:error] = "Link required!"
      render :new
    end
  
  end

  def edit
    @picture = Picture.find params[:id]
  end

  def update
    @picture = Picture.find params[:id]
    if @picture.update picture_params
      redirect_to pictures_path, flash: {success: "Picture updated!"}
    else
      flash[:error] = "Link required!"
      render :edit
    end
  end

  def destroy
    @picture = Picture.find params[:id]
    if @picture.destroy
      redirect_to pictures_path, flash: {success: "Picture removed from list!"}
    else
      redirect_to pictures_path
    end
  end

  private

    def picture_params
      params.require(:picture).permit(:name, :link)
    end

end