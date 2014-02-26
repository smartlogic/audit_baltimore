require 'spec_helper'

describe VoterVerifier do
  let(:signer) { Signer.new({
    :first_name => "Eric",
    :last_name => "User",
    :birthday => Date.parse("1980-01-25"),
    :zipcode => "21224"
  }) }

  it "should verify a signer's information" do
    stub_request(:get, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/search.html"), :headers => { "Content-Type" => "text/html" })
    stub_request(:post, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/results.html"), :headers => { "Content-Type" => "text/html" })

    verifier = VoterVerifier.new(signer)
    address = verifier.verify!

    expect(address.line_1).to eq("123  Elm St")
    expect(address.line_2).to eq("Baltimore, MD 21224")
  end

  it "should return nil if bad verification" do
    stub_request(:get, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/search.html"), :headers => { "Content-Type" => "text/html" })
    stub_request(:post, "https://voterservices.elections.state.md.us/VoterSearch").
      to_return(:body => File.read("spec/fixtures/bad-results.html"), :headers => { "Content-Type" => "text/html" })

    verifier = VoterVerifier.new(signer)
    expect(verifier.verify!).to be_nil
  end
end
