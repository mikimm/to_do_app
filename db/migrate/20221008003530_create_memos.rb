class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text   :url,null:false
      t.string :region,null:false
      t.string :phone_number, null: false
      t.string :CEO, null:false
      t.text   :content,null:false
      t.integer :user_id
      t.integer :task_id
      t.timestamps
    end
  end
end
