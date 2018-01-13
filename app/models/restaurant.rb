class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :category
end
