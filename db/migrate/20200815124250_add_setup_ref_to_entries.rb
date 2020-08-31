class AddSetupRefToEntries < ActiveRecord::Migration[6.1]
  def change
    add_reference :entries, :setup, null: false, foreign_key: true
    add_reference :entries, :strategy, null: false, foreign_key: true
  end
end
