class AddExtraFieldsToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :trade_number, :integer
    add_column :entries, :pl, :decimal
    add_column :entries, :result_in_r, :decimal
    add_column :entries, :setup_quality, :boolean
    add_column :entries, :followed_entry_plan, :boolean
    add_column :entries, :followed_management_plan, :boolean
    add_column :entries, :tags, :string
    add_column :entries, :trade_direction, :string
  end
end
