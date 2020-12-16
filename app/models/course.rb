class Course < ApplicationRecord
  belongs_to :user

  has_many :subcribe_courses
  has_many :users, :through => :subcribe_courses

  enum status: [:pending, :approved, :cancelled]

  has_rich_text :content
  has_one_attached :photo

  validates :name, :introduction, :price, :content, presence: true
  validates :photo, content_type: [:png, :jpg, :jpeg]
end
