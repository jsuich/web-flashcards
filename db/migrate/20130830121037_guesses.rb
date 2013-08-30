class Guesses < ActiveRecord::Migration

  def change

    change table :guesses do |t|
      t.belongs_to :round
      t.string :input
      t.boolean :correctness

      t.timestamps
    end

  end

end
