class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
end
