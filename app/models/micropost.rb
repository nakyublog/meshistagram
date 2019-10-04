class Micropost < ApplicationRecord
  belongs_to :user
  has_many :notifications,dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :img, ImgUploader
  def create_notification_by(current_user)
    notification=current_user.active_notifications.new(
      micropost_id:self.id,
      visited_id:self.contributer.id,
      action:"like"
    )
    notification.save if notification.valid?
  end
  def self.search(search)
      return Micropost.all unless search
      Micropost.where(['content LIKE ?', "%#{search}%"])
  end
end
