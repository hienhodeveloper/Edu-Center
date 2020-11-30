json.extract! course, :id, :name, :introduction, :price, :address, :goal, :condition, :degree, :course_content, :status, :created_at, :updated_at
json.url course_url(course, format: :json)
