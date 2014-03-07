require 'spec_helper'

describe "Signing the peition" do
  example "User signing the petition" do
    Voter.create({
      :lastname => "user",
      :firstname => "eric",
      :address => "123 Elm St",
      :residentialcity => "Baltimore",
      :residentialstate => "MD",
      :residentialzip5 => "21224"
    })

    visit root_path

    fill_in "Email", :with => "eric@example.com"
    click_on "Next"

    fill_in "First Name", :with => "Eric"
    fill_in "Last Name", :with => "User"
    select "1980", :from => "signer_birthday_1i"
    select "January", :from => "signer_birthday_2i"
    select "25", :from => "signer_birthday_3i"
    fill_in "Zip Code", :with => "21224"
    click_on "Verify"

    expect(page).to have_content("123 Elm St")

    click_on "Send PDF"

    expect(PdfGenerator.jobs.count).to eq(1)
  end

  example "User signing the peition bad data" do
    visit root_path

    fill_in "Email", :with => "eric@example.com"
    click_on "Next"

    fill_in "First Name", :with => "Eric"
    fill_in "Last Name", :with => "User"
    select "1980", :from => "signer_birthday_1i"
    select "January", :from => "signer_birthday_2i"
    select "25", :from => "signer_birthday_3i"
    fill_in "Zip Code", :with => "21224"
    click_on "Verify"

    expect(page).to have_content("There was an issue")
    expect(current_path).to eq("/signer/verify")
  end
end
