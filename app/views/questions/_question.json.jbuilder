json.extract! question, :id, :titulo, :texto, :created_at, :updated_at
json.url question_url(question, format: :json)
