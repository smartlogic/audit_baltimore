require 'spec_helper'

describe Signer do
  let(:signer) { Signer.new({
    :first_name => "Eric",
    :last_name => "User",
    :birthday => Date.parse("1980-01-25"),
    :zipcode => "21224"
  }) }

  class TestVerifier
    def initialize(signer)
    end

    def verify!
      Address.new("123 Elm St", "Baltimore, MD 21224")
    end
  end

  class TestVerifierFail
    def initialize(signer)
    end

    def verify!
    end
  end

  context "verify user information" do
    example "good data" do
      signer.verify!(TestVerifier)

      expect(signer.address_line_1).to eq("123 Elm St")
      expect(signer.address_line_2).to eq("Baltimore, MD 21224")
    end

    example "bad data" do
      signer.verify!(TestVerifierFail)

      expect(signer.address_line_1).to be_nil
      expect(signer.address_line_2).to be_nil
    end
  end
end
