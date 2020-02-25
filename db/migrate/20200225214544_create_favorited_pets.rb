class CreateFavoritedPets < ActiveRecord::Migration[6.0]
  def change
    create_table :favorited_pets do |t|
      t.integer :api_id

      t.timestamps
    end
  end
end
