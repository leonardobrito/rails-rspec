# frozen_string_literal: true

# describe HTTParty, :vcr do
# describe HTTParty, vcr: { cassette_name: 'jsonplaceholder/posts' } do
describe HTTParty, vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
  it 'content-type' do
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2')
    #   .to_return(status: 200, body: '', headers: {
    #                'content-type': 'application/json'
    #              })

    # VCR.use_cassette('jsonplaceholder/posts') do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')

    content_type = response.headers['content-type']
    expect(content_type).to match(%r{application/json})
    # end
  end
end
