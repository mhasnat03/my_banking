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
		print 'Please enter 4 digit pin: '
		pin_answer = gets.chomp
		client_account = AccountsHolder.validate_credentials(account_number, pin_answer)
		if client_account
			print 'Please type D for deposit, W for withdrawl, B for balance: '

		else
			puts 'Invalid credentials. Goodbye'
		end
	end
end

Prompt.new.welcome
