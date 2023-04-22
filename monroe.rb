class Monroe
  def erb(filename, local = {})
    b = binding # gives the file access to `message` when `binding` is passed in
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b) # seems to actually pass in the binding?
  end

  def response(status, headers, body = '')
    body = yield if block_given?
    [status, headers, [body]]
  end
end
