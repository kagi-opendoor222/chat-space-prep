class Message < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group
  #validation
  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
