class Person < ApplicationRecord
  validates_presence_of :name, :message => "Name is required"
  validates_presence_of :favoriteCity, :message => "City is required" 
end
