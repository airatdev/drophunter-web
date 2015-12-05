class DroplrFilesController < ApplicationController
  def index
    @droplr_files = DroplrFile.image.page(params[:page])
  end
end
