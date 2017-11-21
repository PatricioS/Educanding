json.extract! answercomment, :id, :user_id, :answer_id, :texto, :created_at, :updated_at
json.url answercomment_url(answercomment, format: :json)
