class Book < ActiveRecord::Base
    mount_uploader :image, PhotoUploader
end
