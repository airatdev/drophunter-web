class SaveDroplrFileJob < ActiveJob::Base
  def perform(id)
    if !DroplrFile.find_by(droplr_id: id)
      ActiveRecord::Base.transaction do
        if cloudinary_url = Drophunter::Page.new(id).save(Drophunter::FileTypes::Image, saver)
          DroplrFile.create(
            droplr_id: id,
            url: cloudinary_url,
            kind: :image
          )
        end
      end
    end
  end

  private

  def saver
    Drophunter::Savers::Cloudinary.new
  end

  class Drophunter::Savers::Cloudinary
    def save(id, url)
      Cloudinary::Uploader.upload(url)["url"]
    end
  end
end
