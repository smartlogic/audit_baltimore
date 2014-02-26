require 'spec_helper'

describe "Signing the peition" do
  example "User signing the petition" do
    stub_request(:get, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/search.html"), :headers => { "Content-Type" => "text/html" })
    stub_request(:post, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/results.html"), :headers => { "Content-Type" => "text/html" })

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
  end

  example "User signing the peition bad data" do
    stub_request(:get, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/search.html"), :headers => { "Content-Type" => "text/html" })
    stub_request(:post, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/bad-results.html"), :headers => { "Content-Type" => "text/html" })

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
