class Person < ApplicationRecord
  validates_presence_of :name, :message => "Enter name please"
  validates_presence_of :favoriteCity, :message => "Enter city please" 
end
