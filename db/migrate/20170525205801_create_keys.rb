class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.integer :x
      t.integer :y
      t.boolean :available, :default => false
      t.belongs_to :board, foreign_key: true

      t.timestamps
    end
  end
end
