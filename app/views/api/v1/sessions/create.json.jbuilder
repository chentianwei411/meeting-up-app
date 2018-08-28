json.session do
  json.id @user.id
  json.name @user.email
  json.token @user.authentication_token
end
