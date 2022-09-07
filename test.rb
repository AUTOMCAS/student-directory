def filename_input(menu_input)
  puts "Enter a filename or press enter for default"
  filename = gets.chomp
  if filename.empty?
    puts "yes"
  #elsif filename == nil && menu_input == :load
    #load_students
  #elsif menu_input == :save
    #save_students(filename)
  #elsif menu_input == :load
    #load_students(filename)
  end
end

filename_input(:save)
