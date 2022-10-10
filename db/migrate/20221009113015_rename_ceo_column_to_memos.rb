class RenameCeoColumnToMemos < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :ceo,:ceo
  end
end
