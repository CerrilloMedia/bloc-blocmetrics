class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  
  validates :url, presence: true, :url => true
  validates :title, presence: true, uniqueness: true
  
end
