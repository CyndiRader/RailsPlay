json.array!(@selected_pets) do |selected_pet|
  json.extract! selected_pet, :id, :pet_id, :cart_id
  json.url selected_pet_url(selected_pet, format: :json)
end
