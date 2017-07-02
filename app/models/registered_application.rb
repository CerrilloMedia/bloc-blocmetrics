class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  
  validates :url, presence: true, :url => true
  validates :title, presence: true, uniqueness: true
  
end
