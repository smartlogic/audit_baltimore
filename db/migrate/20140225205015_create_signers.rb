class CreateSigners < ActiveRecord::Migration
  def change
    create_table :signers do |t|
      t.string :email
      t.string :status

      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :zipcode

      t.timestamps
    end
  end
end
