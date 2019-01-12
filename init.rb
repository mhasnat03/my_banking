require_relative 'lib/accounts'
require_relative 'lib/accounts_holder'
require 'pry-byebug'
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
		print 'would you like to create another account? y/n: '
		another_account_input = gets.chomp.downcase
		if another_account_input == 'y'
			sign_up_prompt
		elsif another_account_input == 'n'
			print 'Would you like to perform a transaction in your account? y/n: '
			transaction_answer = gets.chomp.downcase
			if transaction_answer == 'y'
				login
			else
				puts 'Thank you! Goodbye'
			end
		else
			puts 'We dont recognize that command. Please login and try again. Thank You goodbye'
		end
	end

	def login
		print 'Please enter account #: '
		account_number = gets.chomp
		account_list = AccountsHolder.save_account(self)
		validate_account_number(account_list, account_number)
	end

	def validate_account_number(account_list, account_number)
		account_list.each do |x|
			account = account_number
			 if x.account_number == account
				 current_account = x.account_number
				 current_pin = x.pin
				 validate_pin(current_account, current_pin)
				 return
			 else
				 puts 'account number does not exist in the system. Goodbye'
			 end
		end
	end

	def validate_pin(current_account, current_pin)
		print 'please enter your pin: '
		pin_answer = gets.chomp
		if pin_answer == current_pin
			puts 'we have a match '
		else
			puts 'pin does not match, Goodbye'
		end
	end
end

Prompt.new.welcome
