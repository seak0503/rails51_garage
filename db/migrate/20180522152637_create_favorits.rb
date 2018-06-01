class CreateFavorits < ActiveRecord::Migration[5.1]
  def change
    create_table :favorits do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.boolean :favorit, null: false, default: false

      t.timestamps
    end
  end
end
