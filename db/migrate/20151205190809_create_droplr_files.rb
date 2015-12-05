class CreateDroplrFiles < ActiveRecord::Migration
  def change
    create_table :droplr_files do |t|
      t.string :url, null: false
      t.string :droplr_id, null: false
      t.integer :kind, null: false, default: 0

      t.timestamps null: false
    end
  end
end
