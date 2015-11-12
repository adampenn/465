class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :images, dependent: :destroy
  has_many :imageusers, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
