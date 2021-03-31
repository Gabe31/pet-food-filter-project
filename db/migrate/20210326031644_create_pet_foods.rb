class CreatePetFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_foods do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
