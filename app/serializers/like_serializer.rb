class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :pet_id, :pet
end
