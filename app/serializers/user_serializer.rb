class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :city, :state, :country, :postcode
end
