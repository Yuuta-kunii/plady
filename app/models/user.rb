class User < ApplicationRecord
  has_secure_password
  
  
  has_many :topics
  
  has_many :favorites
  has_many :favorite_topic,through: :favorite,source: "topic"
  
  has_many :comments
  has_many :comment_topics,through: :comment,source: "topic"
  
  has_many :relationships
  has_many :followings,through: :relationships,source: "follow"
  has_many :reverces_of_relationships,class_name: "Relationship",foreign_key: "follow_id"
  has_many :follower,through: :reverces_of_relationships,source: "user"
  
  mount_uploader :image_icon,ImageUploader
  
  
  
  def follow(other_user)
    unless self==other_user
      self.relationship.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow
    relationship = self.relationship.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  

    
end
