class AddColumnToPets < ActiveRecord::Migration[6.0]
  def change
    change_table :pets do |t|
      t.string :primary_photo_cropped
    end
  end
end
