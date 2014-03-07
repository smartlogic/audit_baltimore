desc "Import voters"
task :import_voters, [:environment] do
  CSV.foreach("voterfile.txt", :headers => true, :col_sep => "\t").each do |row|
    voter_hash = {}
    row.headers.compact.inject({}) do |key|
      voter_hash[key.downcase] = row[key]
    end

    Voter.create(voter_hash)
  end
end
