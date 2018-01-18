class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader
  belongs_to :category
  has_many :comments , dependent: :destroy
end
