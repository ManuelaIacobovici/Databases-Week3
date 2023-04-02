require 'user_repository'

RSpec.describe do

	def reset_users_table
		seed_sql = File.read('spec/seeds_users.sql')
		connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
		connection.exec(seed_sql)
	end

	before(:each) do 
    reset_users_table
  end

	it 'returns the users' do
	 repo = UserRepository.new

	 users = repo.all
	 expect(users.length).to eq 3
	 expect(users.first.id).to eq '1'
	 expect(users.first.user_account).to eq 'user_account_1'
	 expect(users.first.email_address).to eq 'email1@yahoo.co.uk'
	 expect(users.first.username).to eq 'username_1'
	end

	it 'returns a single user' do
		repo = UserRepository.new
		user = repo.find(1)
		expect(user.user_account).to eq ('user_account_1')
		expect(user.email_address).to eq ('email1@yahoo.co.uk')
		expect(user.username).to eq ('username_1')
	end

	it 'creates a new user' do
		repo = UserRepository.new
		new_user = User.new
		new_user.user_account = 'user_account_4'
		new_user.email_address = 'email4@yahoo.co.uk'
		new_user.username = 'username_4'

		repo.create(new_user)

		users = repo.all
		last_user = users.last

		expect(last_user.user_account).to eq ('user_account_4')
		expect(last_user.email_address).to eq ('email4@yahoo.co.uk')
		expect(last_user.username).to eq ('username_4')
	end

	it 'deletes user with id 1' do
		repo = UserRepository.new
      
		repo.delete(1)

		all_users = repo.all
		expect(all_users.length).to eq(2)
		expect(all_users.first.id).to eq('2')
	end
end