class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.belongs_to :user
      t.belongs_to :favorited_pet

      t.timestamps
    end
  end
end
