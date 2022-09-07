def menu_list
  menu = { 
    "1" => "Input the students",
    "2" => "Show the students",
    "3" => "Save the list to students.csv",
    "4" => "Load list from students.csv",
    "9" => "Exit"
  }
end

def print_menu

  menu_list.each_value do |value|
    puts value
  end

end

print_menu