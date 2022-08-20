require_relative 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    author = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.')
    post = Post.create(author:, title: 'My post', text: 'Hey there') # rubocop:todo Lint/UselessAssignment
  end
  it 'is it valid with attributes' do
    Like.create(post:, author:)
  end
  it 'should update likes_counter' do
    Like.create(post:, author:)
    expect(post.likes_counter).to eq(1)
  end
end
