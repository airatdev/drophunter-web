class DroplrFile < ActiveRecord::Base
  enum kind: [:error, :image]
end
