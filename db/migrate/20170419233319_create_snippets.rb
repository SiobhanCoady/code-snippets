class CreateSnippets < ActiveRecord::Migration[5.0]
  def change
    create_table :snippets do |t|
      t.string :kind
      t.string :title
      t.text :work
      t.boolean :is_private, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
