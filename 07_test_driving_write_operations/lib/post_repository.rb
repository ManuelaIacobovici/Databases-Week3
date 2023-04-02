require_relative './post'

class PostRepository
	def all
		posts =[]
		sql = 'SELECT id, title, content, number_of_views FROM posts;'
		result_set = DatabaseConnection.exec_params(sql, [])
		
		result_set.each do |record|
			post = Post.new

			post.id = record['id']
			post.title = record['title']
			post.content = record['content']
			post.number_of_views = record['number_of_views'].to_i

			posts << post
    end
		return posts
	end 

	def find(id)
		sql = 'SELECT id, title, content, number_of_views, user_id FROM posts WHERE id = $1;'
		sql_params = [id]

		result_set = DatabaseConnection.exec_params(sql, sql_params)
		record = result_set[0]

        post = Post.new
		post.id = record['id']
		post.title = record['title']
		post.content = record['content']
		post.number_of_views = record['number_of_views']
		post.user_id = record['user_id']

		return post
	end

	def create(new_post)
		sql = 'INSERT INTO
		      posts(title, content, number_of_views, user_id)
			  VALUES($1, $2, $3, $4);'
	    sql_params = [new_post.title, new_post.content, new_post.number_of_views, new_post.user_id]

		DatabaseConnection.exec_params(sql, sql_params)

		return nil
	end
	
	def delete(id)
		sql = 'DELETE FROM posts WHERE id = $1;'
		sql_params = [id]

		DatabaseConnection.exec_params(sql, sql_params)

		return nil
	end
end	