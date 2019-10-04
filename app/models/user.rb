class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :microposts
  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
      user.image = auth.info.image.gsub("_normal","") if user.provider == "twitter"
      user.image = auth.info.image.gsub("picture","picture?type=large") if user.provider == "facebook"
    end
  end
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
 
  def current_user?(user)
     user == current_user
  end 
   def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
  def visiter
    return User.find_by(id:visiter_id)
  end
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
  def already_liked?(micropost)
    self.likes.exists?(micropost_id: micropost.id)
  end
end
