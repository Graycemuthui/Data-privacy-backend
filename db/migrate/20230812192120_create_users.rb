class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date   :due_date
      t.string :phone_number
      t.string :role , default: "user"

      t.timestamps
    end
  end
end
