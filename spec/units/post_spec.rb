require 'pg'
require_relative '../../lib/post'

describe Post do
  let(:username) { double :username }
  let(:title) { double :post_title }
  let(:message) { double :message }
  let(:connection) { PG.connect(dbname: 'message_board_test') }

  it 'can show posts' do
    connection.exec("INSERT INTO posts (username, title, message) VALUES ('#{username}', '#{title}', '#{message}')")
    posts = Post.show_all
    expect(posts.first.username).to eq "#{username}"
    expect(posts.first.title).to eq "#{title}"
    expect(posts.first.message).to eq "#{message}"
  end

  it 'can add a post' do
    Post.add(username: "test123", title: "testy Title", message: message)
    posts = Post.show_all
    expect(posts.first.username).to eq "test123"
    expect(posts.first.title).to eq "testy Title"
    expect(posts.first.message).to eq "#{message}"
  end
end
