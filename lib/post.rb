require "pg"

class Post
  attr_reader :username, :title, :message

  def self.show_all
    # connection = PG.connect(dbname: "message_board_test")
    self.environment
    posts = @connection.exec("SELECT * FROM posts;")
    posts.map { |post| Post.new(id: post['id'], username: post['username'], title: post['title'], message: post['message']) }
  end

  def initialize(username:, title:, message:, id:)
    @username = username
    @title = title
    @message = message
    @id = id
  end

  def self.add(username:, title:, message:)
    @connection.exec_params("INSERT INTO posts (username, title, message) VALUES($1, $2, $3);", [username, title, message])
  end

  private

  def self.environment
    if ENV["ENVIRONMENT"] == "test"
      @connection = PG.connect(dbname: "message_board_test")
    else
      @connection = PG.connect(dbname: "message_board")
    end
  end
end
