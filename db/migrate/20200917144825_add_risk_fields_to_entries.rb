class AddRiskFieldsToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :risk_in_r, :decimal, before: :result_in_r
  end
end
