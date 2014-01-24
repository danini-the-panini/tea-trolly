class Item < ActiveRecord::Base
  attr_accessible :name, :description, :price
  attr_readable :id

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, minimum: 3
  validates_presence_of :price
  validates_numericality_of :price, greater_than_or_equal_to: 0.0
  validates_presence_of :description
end
