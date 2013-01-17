# Allows parsing Transact-SQL strings (for SQL Server) into batches of SQL
# statements around to `GO` command, making .sql source files compatiable with
# TinyTds
module TsqlGoParser

  # Splits one or more SQL strings into batches around GO commands
  # 
  # @param [String] sql  A string or Array of strings of SQL, possibly containing the GO command
  # @return [Array] An array of SQL strings, split on GO commands
  def split_on_go(sql)
    # Recursively handle arrays of strings
    if sql.is_a? Array
      results = []
      sql.each do |query|
        results += split_on_go query
      end
      return results
    end

    statements = ['']
    to_process = sql
    in_string = false
    go_regex = /(?:\n|\A)^\s*go\s*(--.*)?$(?:\n|\z)/i

    while to_process.length > 0
      next_quote = to_process.index "'"
      next_go = to_process.index go_regex

      # Short-circuit if we don't have a go statement
      if next_go == nil
        statements[-1] += to_process
        break
      end

      operation = (next_quote and next_quote < next_go) ? 'quote' : 'go'

      if operation == 'quote'
        
        if not in_string
          in_string = true
          statements[-1] += to_process[0..next_quote]
          to_process = to_process[(next_quote + 1)..-1]
          next
        end

        # If there are characters after the quote, test for double quote
        offset = 0
        in_string = false
        if to_process.length > next_quote + 1
          if to_process[next_quote + 1] == "'"
            offset = 1
            in_string = true
          end
        end

        statements[-1] += to_process[0..(next_quote + offset)]
        to_process = to_process[(next_quote + offset + 1)..-1]

      elsif operation == 'go'
        match = go_regex.match to_process

        # Start a new statement
        statements[-1] += match.pre_match
        statements << ''
        to_process = match.post_match
      end
    end

    statements.map! do |stmt|
      stmt.strip!
      stmt.length > 0 ? stmt : nil
    end
    statements.compact
  end

end