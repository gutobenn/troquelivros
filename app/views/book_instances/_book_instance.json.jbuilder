json.extract! book_instance, :id, :book_id, :user_id, :description, :created_at, :updated_at
json.url book_instance_url(book_instance, format: :json)
