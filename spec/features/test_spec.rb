feature 'testing infrastructure working' do
  scenario 'it can load a test page' do
    visit ('/test')
    expect(page.status_code).to be 200
  end
end
