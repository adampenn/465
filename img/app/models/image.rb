class Image < ActiveRecord::Base
  belongs_to :User 
  has_many :Tags
  has_many :ImageUsers
end
