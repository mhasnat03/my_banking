class AccountsHolder
	
	@@accounts_list = []

	def self.save_account(list_item)
		@@accounts_list << list_item
	end

	def self.validate_credentials(account_number, pin_answer)
		@@accounts_list.each do |saved|
			if saved.account_number == account_number && saved.pin == pin_answer
				 return saved
			end
		end
		nil
	end
end

# save a list of accounts with name pin and bal along with acct number
# 
# [a - 12345, b- 12345]

#question for gautham
# why did I have to use self.create_users and when I just used create_users I got a undefined method or variable error.