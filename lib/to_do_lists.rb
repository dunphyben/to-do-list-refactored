require './lib/to_do'
require './lib/list_class'


def main_menu

  puts "\nPress 'n' to create a new list"
  puts "Press 'v' to view all of your to-do lists"
  puts "Press 'ex' to exit"

  main_choice = gets.chomp
  if main_choice == 'n'
    new_list
  elsif main_choice == 'v'
    view_lists
  elsif main_choice == 'ex'
    puts "Bye!"
  else
    puts "Sorry, that wasn't a valid options."
    main_menu
  end
end

def new_list
  puts "Enter your list name:"
  list_name = gets.chomp
  new_list = List.create(list_name)
  puts "\nList was added successfully. Yay!\n\n"
  puts "Press 'y' to add tasks now. Press 'm' for main menu\n\n"

  task_choice = gets.chomp
  if task_choice == "y"
    add_task(new_list)
  elsif task_choice == "m"
    main_menu
  else
    puts "\n\nDude whatchu tryin to do? Das not valid.\n\n"
    new_list
  end
  main_menu
end

def view_lists
  puts "Here are all your dumb lists:"


  # puts "#{List.list_name}"
  # list.tasks.each_with_index do |task, index|
  #   puts "#{index+1}: #{task.description}"
  # end

    List.all.each_with_index do |list, index|
      puts "#{index + 1}. #{list}"
      Task.all.each_with_index do |task, index|
        puts "#{index + 1}. #{task.description}\n"
      end
    end

  # List.all.each_with_index do |list, index|
  #   puts "\n" + "\n\n#{index + 1}. #{list.list_name}\n" + "----------------------\n"
  #   Task.all.each_with_index do |task, index|
  #     puts "#{index+1}: #{task.description}\n\n"
      # break
  #     puts "hi, I will be a task someday"
  #   end
  # end
  # puts "Enter the number of the list you wish to add tasks"
  # selected_list = gets.chomp
  # List.all[selected_list - 1].marked_list


end







def sub_menu

  puts "Press 'a' to add a task, 'l' to list all of your tasks, or 'd' to mark task done."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_task
  when 'l'
    list_tasks
  when 'd'
    delete_task
  when 'x'
    puts "Good-bye!"
  else
    puts "Sorry, that wasn't a valid option."
    main_menu
  end
end

def add_task(list)
  puts "\nEnter a description of the new task:"
  user_description = gets.chomp
  list.add_task(user_description)
  puts "Task added.\n\n"

  puts "#{list.list_name}"
  list.tasks.each_with_index do |task, index|
    puts "#{index+1}: #{task.description}\n\n"
  end

  puts "What else you got? New task enter 'y' - back to main menu enter 'n'."
  user_input = gets.chomp
  case user_input
  when 'y'
    add_task(list)
  when 'n'
    main_menu
    # break
  end

end

# def list_tasks
#   puts "Here are all of your tasks:"
#   Task.all.each_with_index do |task, index|
#     puts "#{index + 1}. #{task.description}\n"
#   end
#   puts "\n"
#   main_menu
# end

def delete_task
  puts "Which task would you like to delete? \n"
  Task.all.each_with_index do |task, index|
    puts "#{index + 1}. #{task.description}\n"
  end
  task_to_delete = gets.chomp.to_i
  Task.all[task_to_delete - 1].marked_done
  Task.all.delete(Task.all[task_to_delete - 1])
    puts "\n\nTask #{task_to_delete} has been deleted.\n\n"
  main_menu
end

# def completed_tasks
#   puts "hello"
# end



main_menu
