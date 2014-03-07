require "spec_helper"

describe PdfGenerator do
  it "should generate a pdf and mail it to the user" do
    voter = Voter.create({
      :lastname => "User",
      :firstname => "Eric",
      :address => "123 Elm St",
      :residentialcity => "Baltimore",
      :residentialstate => "MD",
      :residentialzip5 => "21224"
    })

    signer = Signer.create({
      :email => "eric@example.com",
      :voter => voter
    })

    PdfGenerator.new.perform(signer.id)

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    mail = ActionMailer::Base.deliveries.first

    expect(mail.attachments.count).to eq(1)
  end
end
