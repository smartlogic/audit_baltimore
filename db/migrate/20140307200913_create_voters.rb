class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :vtrid
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :suffix
      t.string :dob
      t.string :gender
      t.string :party
      t.string :house_number
      t.string :house_suffix
      t.string :street_predirection
      t.string :streetname
      t.string :streettype
      t.string :street_postdirection
      t.string :unittype
      t.string :unitnumber
      t.string :address
      t.string :non_std_address
      t.string :residentialcity
      t.string :residentialstate
      t.string :residentialzip5
      t.string :residentialzip4
      t.string :mailingaddress
      t.string :mailingcity
      t.string :mailingstate
      t.string :mailingzip5
      t.string :mailingzip4
      t.string :country
      t.string :status_code
      t.string :state_registration_date
      t.string :county_registration_date
      t.string :precinct
      t.string :split
      t.string :county
      t.string :congressional_districts
      t.string :legislative_districts
      t.string :councilmanic_districts
      t.string :ward_districts
      t.string :municipal_districts
      t.string :commissioner_districts
      t.string :school_districts
    end

    add_column :signers, :voter_id, :integer
    remove_column :signers, :address_line_1, :string
    remove_column :signers, :address_line_2, :string

    add_index :voters, [:firstname, :lastname, :mailingzip5]
  end
end
