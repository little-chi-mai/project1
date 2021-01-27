class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find params[:id]
  end

  def new
    @brand = Brand.new
  end

  def create
    brand = Brand.new(brand_params)
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      brand.image = req["public_id"]
      brand.save
    end
    redirect_back fallback_location: root_path
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    brand = Brand.new(brand_params)
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      brand.image = req["public_id"]
    end
    brand.update_attributes(brand_params)
    brand.save
    redirect_to(brand_path(brand))
  end

  private
  def brand_params
    params.require(:brand).permit(:name)
  end


end
