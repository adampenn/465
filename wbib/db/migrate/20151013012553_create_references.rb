class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :URL
      t.datetime :time
      t.references :topic, index: true

      t.timestamps null: false
    end
  end
end
