json.extract! transaction, :id, :user_id, :book_instance_id, :type, :status, :date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
