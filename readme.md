# TsqlGoParser

A small ruby module for parsing a string of T-SQL and splitting on `go` statements so batches can be properly run via TinyTds.

## Installation

In Rails, add it to your Gemfile:

```ruby
gem 'tsql_go_parser', :git => 'git://github.com/veracross/tsql_go_parser.git'
```

## Usage

```ruby
class SqlParser
  include TsqlGoParser
end

parser = SqlParser.new
sql_batches = parser.split_on_go File.read('/path/to.sql')
```

## License

Copyright (c) 2012-2013 Will Bond (Breuer & Co LLC) <wbond@breuer.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.