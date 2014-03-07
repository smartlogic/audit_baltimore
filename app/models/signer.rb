class Signer < ActiveRecord::Base
  belongs_to :voter

  delegate :address, :residentialcity, :residentialstate, :residentialzip5,
    :to => :voter, :allow_nil => true

  def verify!
    self.voter = Voter.where({
      :lastname => last_name.downcase,
      :firstname => first_name.downcase,
      :residentialzip5 => zipcode
    }).first
    save!
    voter
  end

  def address_line_1
    address
  end

  def address_line_2
    "#{residentialcity}, #{residentialstate} #{residentialzip5}"
  end
end
