module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = UserInput.get_normalized_input
      break if verb == USER_EXIT_ANSWER
    

      action = nil

      if verb == 'GET' 
        print 'Choose action (index/show) / q to exit: '
        action = UserInput.get_normalized_input
        break if action == USER_EXIT_ANSWER
      
      end
    
      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end