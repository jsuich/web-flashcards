class Cards < ActiveRecord::Migration
  
  def change

    create_table :cards do |t|
      t.belongs_to :deck
      
      t.string :term
      t.string :definition

      t.timestamps
    end

  end

end
