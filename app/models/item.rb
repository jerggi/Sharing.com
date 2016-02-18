class Item < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  belongs_to :category
  belongs_to :user
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
  validates :name, presence: true
  validates :price, presence: true,
  :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ },
  :numericality => { :greater_than => 0 }
  validates :location, presence: true
end
