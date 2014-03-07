class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :vtrid # dECIMAL(22)
      t.string :lastname # sTRING(30)
      t.string :firstname # sTRING(30)
      t.string :middlename # sTRING(30)
      t.string :suffix # sTRING(30)
      t.string :dob # sTRING(10)
      t.string :gender # sTRING(1)
      t.string :party # sTRING(5)
      t.integer :house_number # dECIMAL(22)
      t.string :house_suffix # sTRING(10)
      t.string :street_predirection # sTRING(10)
      t.string :streetname # sTRING(50)
      t.string :streettype # sTRING(10)
      t.string :street_postdirection # sTRING(10)
      t.string :unittype # sTRING(10)
      t.string :unitnumber # sTRING(20)
      t.string :address # sTRING(167)
      t.string :non_std_address # sTRING(256)
      t.string :residentialcity # sTRING(256)
      t.string :residentialstate # sTRING(2)
      t.string :residentialzip5 # sTRING(5)
      t.string :residentialzip4 # sTRING(4)
      t.string :mailingaddress # sTRING(256)
      t.string :mailingcity # sTRING(256)
      t.string :mailingstate # sTRING(2)
      t.string :mailingzip5 # sTRING(5)
      t.string :mailingzip4 # sTRING(4)
      t.string :country # sTRING(128)
      t.string :status_code # sTRING(10)
      t.datetime :state_registration_date # dATEtIME(10)
      t.datetime :county_registration_date # dATEtIME(10)
      t.string :precinct # sTRING(10)
      t.string :split # sTRING(10)
      t.string :county # sTRING(128)
      t.string :congressional_districts # sTRING(10)
      t.string :legislative_districts # sTRING(10)
      t.string :councilmanic_districts # sTRING(10)
      t.string :ward_districts # sTRING(10)
      t.string :municipal_districts # sTRING(10)
      t.string :commissioner_districts # sTRING(10)
      t.string :school_districts # sTRING(10)
    end

    add_column :signers, :voter_id, :integer
    remove_column :signers, :address_line_1
    remove_column :signers, :address_line_2

    add_index :voters, [:firstname, :lastname, :residentialzip5]
  end
end
