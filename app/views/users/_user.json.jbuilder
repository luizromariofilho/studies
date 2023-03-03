json.extract! user, :id, :name, :email
json.token user.generate_jwt
json.roles user.roles
json.url users_url(user, format: :json)
