class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :case_number, unique: true
      t.string :title
      t.string :status
      t.date :date

      t.integer :client_id

      t.timestamps
    end
  end
end
