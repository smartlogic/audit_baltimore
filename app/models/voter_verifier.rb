class VoterVerifier
  def initialize(signer)
    @first_name = signer.first_name
    @last_name = signer.last_name
    @year = signer.birthday.year
    @month = signer.birthday.month
    @day = signer.birthday.day
    @zipcode = signer.zipcode
  end

  def verify!
    agent = Mechanize.new
    agent.get "https://voterservices.elections.state.md.us/VoterSearch"

    form = agent.page.forms[0]

    form["ctl00$listLanguages"] = "en"
    form["ctl00$MainContent$uctlVoterSearch$txtSearchFirstName"] = @first_name
    form["ctl00$MainContent$uctlVoterSearch$txtSearchLastName"] = @last_name
    form["ctl00$MainContent$uctlVoterSearch$txtSearchZipCode"] = @zipcode
    form["ctl00$MainContent$uctlVoterSearch$txtDOBMonth"] = @month
    form["ctl00$MainContent$uctlVoterSearch$txtDOBDay"] = @day
    form["ctl00$MainContent$uctlVoterSearch$txtDOBYear"] = @year
    form["ctl00$MainContent$btnSearch"] = "Search"

    form.submit

    result = agent.page.search("div.result-line")
    text = result.map { |r| r.text.gsub(/^\s+/, "") }.join("\n")


    if match = text.match(/Residential Address:\n(.+?)\n(.+?)\nMailing Address:/m)
      address = Address.new
      address.line_1 = match.captures[0].strip
      address.line_2 = match.captures[1].strip
      address
    end
  end
end