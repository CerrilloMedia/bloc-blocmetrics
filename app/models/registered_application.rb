class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  
  validates :url, presence: true
  validates :title, presence: true, uniqueness: true
end
