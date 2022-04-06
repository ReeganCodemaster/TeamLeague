class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :player_name
      t.references :team, null: false, foreign_key: true
      t.boolean :coordinator

      t.timestamps
    end
  end
end
