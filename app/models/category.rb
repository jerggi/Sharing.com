class Category < ActiveRecord::Base
  has_many :items
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
  default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
  validates :name, presence: true
end
