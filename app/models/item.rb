class Item < ActiveRecord::Base
  has_many :photos
  belongs_to :category
end
