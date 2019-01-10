require_relative 'lib/accounts'

class Prompt

	def welcome
		print "Welcome to Online Banking.\n"

		print "Please type S to signup or L to login: "

		answer = gets.chomp.upcase

		case answer 
		when 'S'
			sign_up_prompt
		when 'L'
			login
		else
			puts 'Invalid input, Goodbye'
		end
	end

	def sign_up_prompt
		print 'Please enter first name: '
		first_name = gets.chomp.capitalize
		print 'Please enter last name: '
		last_name = gets.chomp.capitalize
		print 'Please enter 4 digit pin: '
		pin = gets.chomp
		print 'Please enter the amount of your initial balance: '
		balance = gets.chomp
		new_account = Account.new(first_name, last_name, pin, balance)
		puts "Here is your new account number: #{new_account.new_account_number}"
		print "would you like to create another account? y/n: "
		another_account_input = gets.chomp.downcase
		if another_account_input == 'y'
			sign_up_prompt
		else
			puts "Thank You goodbye"
		end
	end

	def login
		print 'Please enter account #: '
		account_number = gets.chomp
		if account_number == "12345"
			print 'Please enter your 4 digit pin: '
			pin = gets.chomp
			if pin != pin 
				puts "welcome to banking.rb"
			else
				puts "your pin is invalid, Goodbye"
			end
		else	
			puts "Your account doesnt exist. Goodbye"
		end
	end
end

Prompt.new.welcome
