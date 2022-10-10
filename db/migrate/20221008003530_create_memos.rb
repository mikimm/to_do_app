class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text   :url,null:false
      t.string :region,null:false
      t.string :phone_number, null: false
      t.string :ceo, null:false
      t.text   :content,null:false
      t.references :task,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
