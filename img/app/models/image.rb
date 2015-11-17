class Image < ActiveRecord::Base
  belongs_to :user 
  has_many :tags
  has_many :users, through: :imageuser
  accepts_nested_attributes_for :tags
  

  # got algorithm from http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
  def generate_filename
    string = (0...8).map { (65 + rand(26)).chr }.join
    string = string + ".jpg"
    return string
  end
end
