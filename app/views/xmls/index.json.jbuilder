json.array!(@xmls) do |xml|
  json.extract! xml, :id, :alvo, :nome, :operacao, :fase
  json.url xml_url(xml, format: :json)
end
