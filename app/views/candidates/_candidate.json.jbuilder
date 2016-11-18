json.extract! candidate, :id, :name, :biography, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)