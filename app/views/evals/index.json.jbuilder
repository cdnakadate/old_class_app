json.array!(@evals) do |eval|
  json.extract! eval, :id
  json.url eval_url(eval, format: :json)
end
