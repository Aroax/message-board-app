require 'pg'

feature 'a user can post and see their messages' do
  let(:test_message) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla gravida, ipsum sit amet luctus auctor, dolor lorem interdum urna, quis molestie dolor mauris non sem. Etiam quam leo, molestie a tortor at, sollicitudin tincidunt risus. Quisque sed bibendum lorem. Donec facilisis tincidunt viverra. Fusce quis urna non nisl maximus facilisis. Sed nec ipsum sed eros interdum dictum quis eu arcu. Praesent tempus, nunc ut semper pulvinar, magna elit sodales erat, finibus efficitur lacus lacus nec sem. Praesent et nunc sit amet dolor sollicitudin pellentesque nec nec tellus. Donec molestie cursus leo, nec efficitur urna aliquet vitae."}
  let(:user1) { "user1" }
  let(:user2) { "user2" }
  let(:title) { "Test Topic" }
  let(:connection) { PG.connect(dbname: 'message_board_test') }

  scenario 'the user can post and see a message' do
    post_test_message(user1, title, test_message)
    expect(page).to have_content(user1)
    expect(page).to have_content(title)
    expect(page).to have_content(test_message)
  end

  scenario 'the user can see multiple posted messages' do
    post_test_message(user1, title, test_message)
    post_test_message(user2, title, test_message)
    expect(page).to have_content(user1)
    expect(page).to have_content(user2)
    expect(page).to have_content(title)
    expect(page).to have_content(test_message)
  end
end
