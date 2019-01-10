class AccountsHolder
	
	@@accounts_list = []

	def self.save_account(list_item)
		@@accounts_list << list_item
		puts @@accounts_list
	end

end

# save a list of accounts with name pin and bal along with acct number
# 
# [a - 12345, b- 12345]