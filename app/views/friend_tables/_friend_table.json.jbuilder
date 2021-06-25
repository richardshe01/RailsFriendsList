json.extract! friend_table, :id, :first_name, :last_name, :email, :age, :created_at, :updated_at
json.url friend_table_url(friend_table, format: :json)
