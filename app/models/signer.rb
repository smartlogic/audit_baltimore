class Signer < ActiveRecord::Base

  def verify!(verifier = VoterVerifier)
    address = verifier.new(self).verify!
    self.address_line_1 = address.line_1
    self.address_line_2 = address.line_2

    save
  end
end
