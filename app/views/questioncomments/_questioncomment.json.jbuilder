json.extract! questioncomment, :id, :user_id, :question_id, :texto, :created_at, :updated_at
json.url questioncomment_url(questioncomment, format: :json)
