class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :cellnumber
      t.string :email
      t.text :address
      t.attachment :avatar

      t.timestamps
    end
  end
end
