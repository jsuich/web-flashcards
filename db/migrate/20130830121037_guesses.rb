class Guesses < ActiveRecord::Migration

  def change

    change_table :guesses do |t|
      t.belongs_to :card
      t.belongs_to :round
      t.string :input
      t.boolean :correctness

      t.timestamps
    end

  end

end
