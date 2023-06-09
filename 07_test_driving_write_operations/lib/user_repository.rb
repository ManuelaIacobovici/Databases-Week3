require_relative './user'

class UserRepository
	def all
		users = []
		sql = 'SELECT id, user_account, email_address, username FROM users;'
		result_set = DatabaseConnection.exec_params(sql, [])
		
		result_set.each do |record|
			user = User.new

			user.id = record['id']
			user.user_account = record['user_account']
			user.email_address = record['email_address']
			user.username = record['username']

			users << user
        end
		return users
	end
	
	def find(id)
		sql = 'SELECT id, user_account, email_address, username FROM users WHERE id = $1;'
		sql_params = [id]

		result_set = DatabaseConnection.exec_params(sql, sql_params)
		record = result_set[0]

        user = User.new
		user.id = record['id']
		user.user_account = record['user_account']
		user.email_address = record['email_address']
		user.username = record['username']

		return user
	end

	def create(new_user)
		sql = 'INSERT INTO
		      users(user_account, email_address, username)
			  VALUES($1, $2, $3);'
	    sql_params = [new_user.user_account, new_user.email_address, new_user.username]

		DatabaseConnection.exec_params(sql, sql_params)

		return nil
	end

	def delete(id)
		sql = 'DELETE FROM users WHERE id = $1;'
		sql_params = [id]

		DatabaseConnection.exec_params(sql, sql_params)

		return nil
	end
end