require 'spec_helper'

describe "Signing the peition" do
  example "User signing the petition" do
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

    page.should have_content("Verified!")
  end
end
