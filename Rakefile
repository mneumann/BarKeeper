DBNAME='test'

task :migrate do
  sh "sequel -E -m ./migrations postgres://localhost/#{DBNAME}"
end
