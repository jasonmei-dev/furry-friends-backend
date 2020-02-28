class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.integer :pet_api_id

      t.timestamps
    end
  end
end
