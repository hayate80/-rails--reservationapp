class Room < ApplicationRecord
    mount_uploader :room_img, RoomImgUploader
    has_many :reservations, dependent: :destroy
    belongs_to :user
end
