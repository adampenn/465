class Reference < ActiveRecord::Base
  
  belongs_to :topic

  validates :URL, format: { with: /^https?:\/\//, message: "only valid websites allowes, use http://", :multiline => true }
end
