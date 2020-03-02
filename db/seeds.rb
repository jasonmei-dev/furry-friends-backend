# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jason = User.create(first_name: 'Jason', last_name: 'Mei', email: 'jmei403@yahoo.com', password: 'password', city: 'Staten Island', state: 'New York', country: 'United States', postcode: 10304)
helen = User.create(first_name: 'Helen', last_name: 'Shiu', email: 'helennndx@hotmail.com', password: 'password', city: 'Rego Park', state: 'New York', country: 'United States', postcode: 11374)

bailey = Pet.create(pet_api_id: 47409516)
slippers = Pet.create(pet_api_id: 47402188)

Like.create(user_id: jason.id, pet_id: bailey.id)
Like.create(user_id: jason.id, pet_id: slippers.id)
Like.create(user_id: helen.id, pet_id: slippers.id)
