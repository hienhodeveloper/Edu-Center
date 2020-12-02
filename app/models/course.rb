class Course < ApplicationRecord
  enum status: [:pending, :approved, :cancelled]

  has_rich_text :content
  has_one_attached :photo

  validates :name, :introduction, :price, :content, presence: true

end
