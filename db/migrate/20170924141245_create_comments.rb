class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :article, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end