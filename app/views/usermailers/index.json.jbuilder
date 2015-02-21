json.array!(@usermailers) do |usermailer|
  json.extract! usermailer, :id, :name, :email, :login
  json.url usermailer_url(usermailer, format: :json)
end
