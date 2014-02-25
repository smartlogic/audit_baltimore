require 'spec_helper'

describe VoterVerifier do
  it "should verify a signer's information" do
    stub_request(:get, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/search.html"), :headers => { "Content-Type" => "text/html" })
    stub_request(:post, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/results.html"), :headers => { "Content-Type" => "text/html" })

    verifier = VoterVerifier.new("Eric", "User", 1980, 1, 25, "21224")
    address = verifier.verify!

    expect(address.line_1).to eq("123  Elm St")
    expect(address.line_2).to eq("Baltimore, MD 21224")
  end

  it "should return nil if bad verification" do
    stub_request(:get, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/search.html"), :headers => { "Content-Type" => "text/html" })
    stub_request(:post, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/bad-results.html"), :headers => { "Content-Type" => "text/html" })

    verifier = VoterVerifier.new("Eric", "User", 1980, 1, 25, "21224")
    expect(verifier.verify!).to be_nil
  end
end
