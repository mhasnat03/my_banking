require_relative 'accounts_holder'
class Account

	attr_reader :first_name, :last_name, :pin, :balance, :account_number

	def initialize(first_name, last_name, pin, balance)
		@first_name = first_name
	    @last_name = last_name
	    @pin = pin
	    @balance = balance
	    @account_number = nil
	end

	def new_account_number
	   @account_number = rand.to_s[2..7]
	   save_account_in_accounts_holder
	   @account_number
	end

private

	def save_account_in_accounts_holder
		AccountsHolder.save_account(self)
	end
end