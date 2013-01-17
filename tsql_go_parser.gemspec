Gem::Specification.new do |s|
  s.name        = 'tsql_go_parser'
  s.version     = '0.5.0'
  s.date        = '2013-01-17'

  s.summary     = "Parse T-SQL into batches via the 'go' statement"
  s.description = "Parses through T-SQL that runs via SQL Server Management Studio or sqlcmd and splits it into an array of batches that can each be run by TinyTds"

  s.authors     = ['Will Bond']
  s.email       = ['wbond@breuer.com']
  s.homepage    = 'http://github.com/veracross/tsql_go_parser'
  s.license     = 'MIT'
  
  s.files       = ["lib/tsql_go_parser.rb"]
end