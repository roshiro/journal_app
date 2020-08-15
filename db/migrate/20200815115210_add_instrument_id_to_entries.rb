class AddInstrumentIdToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :instrument_id, :integer
  end
end
