require "spec_helper"

describe PdfGenerator do
  it "should generate a pdf and mail it to the user" do
    signer = Signer.create({
      :email => "eric@example.com",
      :address_line_1 => "123 Elm St",
      :address_line_2 => "Baltimore, MD 21224"
    })

    PdfGenerator.new.perform(signer.id)

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    mail = ActionMailer::Base.deliveries.first

    expect(mail.attachments.count).to eq(1)
  end
end
