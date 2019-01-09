class Account

	attr_reader :first_name, :last_name

	def initialize(first_name, last_name, pin, balance)
		@first_name = first_name
	    @last_name = last_name
	    @pin = pin
	    @balance = balance
	end

	def new_account_number
	   rand.to_s[2..7]
	end

end
