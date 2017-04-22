class RemoveKindColumnFromSnippets < ActiveRecord::Migration[5.0]
  def change
    remove_column :snippets, :kind
  end
end
