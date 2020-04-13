class AddColummsToPets < ActiveRecord::Migration[6.0]
  def change
    change_table :pets do |t|
      t.string :name
      t.string :type
      t.string :species
      t.string :age
      t.string :gender
      t.string :size
      t.string :breeds
      t.string :photos
      t.string :contact
    end
  end
end
