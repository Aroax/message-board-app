def post_test_message(user, title, message)
  visit('/posts')
  click_link('New Post')
  fill_in(:name, with: user)
  fill_in(:title, with: title)
  fill_in(:message, with: message)
  click_button('submit')
end
