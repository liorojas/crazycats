json.extract! article, :id, :photo, :description, :when_went, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
