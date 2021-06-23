feature 'a user can post a message' do
  let(:test_message) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla gravida, ipsum sit amet luctus auctor, dolor lorem interdum urna, quis molestie dolor mauris non sem. Etiam quam leo, molestie a tortor at, sollicitudin tincidunt risus. Quisque sed bibendum lorem. Donec facilisis tincidunt viverra. Fusce quis urna non nisl maximus facilisis. Sed nec ipsum sed eros interdum dictum quis eu arcu. Praesent tempus, nunc ut semper pulvinar, magna elit sodales erat, finibus efficitur lacus lacus nec sem. Praesent et nunc sit amet dolor sollicitudin pellentesque nec nec tellus. Donec molestie cursus leo, nec efficitur urna aliquet vitae."}

  scenario 'the user can post a message' do
    visit('/posts')
    click_link('New Post')
    fill_in(:name, with: 'Test_User')
    fill_in(:title, with: 'Test Topic')
    fill_in(:message, with: test_message)
    click_button('submit')
    expect(page).to have_content('Test_User')
    expect(page).to have_content('Test Topic')
    expect(page).to have_content(test_message)
  end
end
