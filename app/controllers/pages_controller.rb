class PagesController < ApplicationController
  def home
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Recipe.all.where("lower(name) LIKE :search", search: "%#{@parameter}%") #search any word that contain the characters
      # @results = Recipe.joins(:country).search(params[:search]).order("countrys.name DESC")

    end

  end
end
