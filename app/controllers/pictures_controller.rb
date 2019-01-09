class PicturesController < ApplicationController
  def create
    @page = Page.find(params[:page_id])
    @picture = @page.pictures.create(picture_params)
    redirect_to page_path(@page)
  end

  private
    def picture_params
      params.require(:picture).permit( :picture)
  end	
end
