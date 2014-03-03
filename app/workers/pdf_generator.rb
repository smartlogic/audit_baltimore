class PdfGenerator
  include Sidekiq::Worker

  def perform(signer_id)
    signer = Signer.find(signer_id)

    Dir.mktmpdir do |dir|
      file_path = Pathname.new(dir).join("form.pdf")
      Prawn::Document.generate(file_path) do
        text signer.first_name
        text signer.address_line_1
        text signer.address_line_2
      end

      PdfMailer.send_pdf(signer.email, file_path).deliver!
    end
  end
end
