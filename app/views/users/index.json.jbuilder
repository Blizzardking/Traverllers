json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :email_address, :age, :gender, :safe_question, :safe_answer
  json.url user_url(user, format: :json)
end
