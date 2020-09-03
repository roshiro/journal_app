class RemoveSymbolFromEntries < ActiveRecord::Migration[6.1]
  def up
    remove_column :entries, :symbol
  end

  def down
    add_column :entries, :symbol, :string
  end
end
