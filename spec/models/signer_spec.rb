require 'spec_helper'

describe Signer do
  let(:signer) { Signer.new({
    :first_name => "Eric",
    :last_name => "User",
    :birthday => Date.parse("1980-01-25"),
    :zipcode => "21224"
  }) }
end
