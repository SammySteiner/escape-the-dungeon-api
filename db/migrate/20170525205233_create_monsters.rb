class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.integer :x
      t.integer :y
      t.belongs_to :board, foreign_key: true

      t.timestamps
    end
  end
end
