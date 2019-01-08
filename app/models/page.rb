class Page < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
end
