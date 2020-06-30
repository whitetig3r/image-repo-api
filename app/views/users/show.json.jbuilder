if @user.errors.empty?
  json.user do
      json.id @user.id
      json.first_name @user.first_name
      json.last_name @user.last_name
      json.email_address @user.email_address
  end
else
  json.errors @user.errors
end