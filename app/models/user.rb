class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     has_many :flowers
     has_many :flowers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_flowers, through: :likes, source: :flower
  has_many :comments, dependent: :destroy
  
  

  mount_uploader :image, ImageUploader

  def already_liked?(flower)
    self.likes.exists?(flower_id: flower.id)
  end
  
  

end
