class Page < ActiveRecord::Base
	has_many :pictures
    accepts_nested_attributes_for :pictures
	validates :title, presence: true
	validates :string, presence: true


end
