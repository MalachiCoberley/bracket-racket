class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.integer :team_id, unique: true
      t.integer :current_season
      t.integer :league_id

      t.timestamps
    end
  end
end
