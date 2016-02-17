class Item < ActiveRecord::Base
  has_many :photos
  belongs_to :category
  accepts_nested_attributes_for :photos
end
