#initialize empty array as an instance variable
@contact_list = Array.new

#add a few random names to it
@contact_list.push("Clayton")
@contact_list.push("John")
@contact_list.push("Amanda")


#build a menu - loop it until the user selects exit
def show_menu()
  puts "Please select from the following options"
  puts "1) Add a contact"
  puts "2) View contacts"
  puts "3) Delete a contact"
  puts "4) Edit a contact"
  puts "5) Exit program"
  menu_selection = gets.strip.to_i

  case menu_selection
  when 1
    puts "Type the name of the contact you wish to add."
    contact_to_add = gets.strip
    add_contact(contact_to_add)
    show_menu()
  when 2
    view_contacts()
    show_menu()
  when 3
    puts "Type the name of the contact you wish to delete"
    contact_to_delete = gets.strip
    delete_index = find_contact(contact_to_delete)
    @contact_list.delete_at(delete_index)
    show_menu()
  when 4
    puts "Which contact would you like to edit?"
    name_to_edit = gets.strip
    edit_index = find_contact(name_to_edit)
    puts "What would you like their new name to be?"
    new_name = gets.strip
    @contact_list[edit_index] = new_name
    show_menu()

  when 5
    exit

  else
    puts "That was not a valid choice, please try again"
    show_menu()

  end
end




#view all contacts
def view_contacts
  puts @contact_list
end

#add a contact
def add_contact(name)
  @contact_list.push(name)
end


#find a contact index
def find_contact(name)
  i = 0
  while i < (@contact_list.length)
    if @contact_list[i] == name
      return i
    else
      i += 1
    end
  end
  puts "Sorry that was not a valid selection"
  show_menu()
end



#initialize the program
show_menu()


