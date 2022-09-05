def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(student_list)
  cohort_filter = :november
  filtered_list = []
  
  student_list.map do |hash| 
    if hash[:cohort] = cohort_filter
      puts hash[:name]
    end
  end

end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do  
    puts "Please enter the hobby of the student"
    hobby = gets.chomp
    puts "Please enter the height of the student"
    height = gets.chomp
    puts "Please enter the cohort of the student"
    cohort = gets.chomp

    until datecheck(cohort) == true
      if cohort.empty?
        cohort = :november 
        break
      end
      puts "Please check your spelling for cohort month"
      cohort = gets.chomp  
    end

    students << {name: name, hobby: hobby, height: height, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def datecheck(month)
  require "date"
  Date::MONTHNAMES.include?(month.capitalize)
end


students = input_students
print_header
print(students)
print_footer(students)
