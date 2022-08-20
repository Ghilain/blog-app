require_relative 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'adds a comment' do
    author = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teach from Poland',
                      postsCounter: 0)
    post = Post.new(title: 'My post', text: 'Hey there', author:, likesCounter: 0, commentsCounter: 0)
    post.save

    comment_creator = User.new(name: 'Ghilain', photo: 'picture.jpeg', bio: 'Web dev', postsCounter: 0)
    comment_creator.save!

    post.comments.create!(text: 'Hey there', author: comment_creator)
    post.comments.create!(text: 'Ohh hello', author: comment_creator)
    expect(post.comments.length).to eql(2)
  end
end
