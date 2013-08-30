class Users < ActiveRecord::Migration

  def change

    create table :users do |t|
      t.string :email
      t.string :password

      t.timestamps
    end

  end

end
