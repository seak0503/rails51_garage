class CreateBooksUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :books_users, id: false do |t|
      t.references :book, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
    end
  end
end
