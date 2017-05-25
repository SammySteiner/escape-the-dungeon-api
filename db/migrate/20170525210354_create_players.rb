class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :x
      t.integer :y
      t.boolean :key, :default => false
      t.integer :hearts
      t.belongs_to :board, foreign_key: true

      t.timestamps
    end
  end
end
