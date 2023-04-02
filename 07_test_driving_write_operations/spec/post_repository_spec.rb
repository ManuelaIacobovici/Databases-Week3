require 'post_repository'

RSpec.describe PostRepository do

  def reset_posts_table
		seed_sql = File.read('spec/seeds_posts.sql')
		connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
		connection.exec(seed_sql)
	end

	  before(:each) do 
      reset_posts_table
    end

  it 'returns the posts' do
		repo = PostRepository.new

		posts = repo.all
		expect(posts.length).to eq 3
		expect(posts.first.id).to eq '1'
		expect(posts.first.title).to eq 'Title_1'
		expect(posts.first.content).to eq 'Content_1'
		expect(posts.first.number_of_views).to eq 10
  end

  it 'returns a single post' do
		repo = PostRepository.new
		
		post = repo.find(1)
		expect(post.title).to eq ('Title_1')
		expect(post.content).to eq ('Content_1')
		expect(post.number_of_views).to eq ('10')
  end

  it 'creates a new post' do
	repo = PostRepository.new
	new_post = Post.new
	new_post.title = 'Title_4'
	new_post.content = 'Content_4'
	new_post.number_of_views = '50'

	repo.create(new_post)

	posts = repo.all
	last_post = posts.last

	expect(last_post.title).to eq ('Title_4')
	expect(last_post.content).to eq ('Content_4')
	expect(last_post.number_of_views).to eq (50)
  end

	it 'deletes post with id 1' do
		repo = PostRepository.new
  
		repo.delete(1)

		posts = repo.all
		expect(posts.length).to eq(2)
		expect(posts.first.id).to eq('2')
	end
end