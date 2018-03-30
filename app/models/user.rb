class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/user_missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :covph, styles: { landscape: "700x300#" }, default_url: "/assets/:style/cover_missing.jpeg"
  validates_attachment_content_type :covph, content_type: /\Aimage\/.*\z/
  validates :accred, presence: false
  validates :experience, presence: false
  validates :details, presence: false
  validates :ident, presence: false

  has_many :founderships, dependent: :destroy
  has_many :startups, through: :foundership

  has_many :posts

end
