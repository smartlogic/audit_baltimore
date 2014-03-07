desc "Import voters"
task :import_voters => [:environment] do
  require 'csv'
  CSV.foreach("voterfile.txt", :headers => true, :col_sep => "\t").each do |row|
    voter_hash = {}
    row.headers.compact.each do |key|
      voter_hash[key.downcase] = row[key]
    end

    voter_hash["firstname"] = voter_hash["firstname"].downcase
    voter_hash["lastname"] = voter_hash["lastname"].downcase

    Voter.create(voter_hash)
  end
end
