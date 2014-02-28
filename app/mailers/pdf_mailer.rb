class PdfMailer < ActionMailer::Base
  default :from => "info@auditbaltimore.com"

  def send_pdf(email, pdf_file_path)
    attachments["form.pdf"] = File.read(pdf_file_path)
    mail :to => email, :subject => "Your form is ready"
  end
end
