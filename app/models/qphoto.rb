class Qphoto < ApplicationRecord

	belongs_to :question
	validates :image, presence: true
	mount_uploader :image, ImageUploader

end
