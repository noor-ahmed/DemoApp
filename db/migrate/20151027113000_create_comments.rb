class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :microposts, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :microposts
    add_foreign_key :comments, :users
  end
end
