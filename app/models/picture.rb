class Picture < ActiveRecord::Base
	belongs_to :page
	mount_uploader :picture, PictureUploader
end
