class Topic < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorite_user,through: :favorite,source: "user"
  has_many :comments
  has_many :comment_users,through: :comment,source: "user"
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  mount_uploader :image,ImageUploader
  
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
