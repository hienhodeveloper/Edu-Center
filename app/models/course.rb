class Course < ApplicationRecord
  enum status: [:approved, :pending, :cancelled]

end
