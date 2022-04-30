class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.integer :team_num

      t.timestamps
    end
  end
end
