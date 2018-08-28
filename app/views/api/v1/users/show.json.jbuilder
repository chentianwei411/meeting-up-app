json.user do
  json.id @user.id
  json.email @user.email
  # json.(@user, :id, :email, :name,  :activated, :admin, :created_at, :updated_at)
end
