class Event < ActiveRecord::Base
  belongs_to :registered_application
  
  validates :name, length: { minimum: 5}, presence: true
  
end