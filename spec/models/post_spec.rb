require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.create(name: 'Lilly', bio: 'Teacher from Poland.')
  author.save

  subject do
    Post.new(title: 'My post', text: 'Hey there', author:)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be invalid if it has more than 250 characters' do
    subject.title = 'New new, New new, New new, New new, New new,
    New new, New new, New new, New new, New new, New new,
    New new, New new'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be numeric' do
    subject.comments_counter < 0 # rubocop:todo Lint/Void
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter < 0 # rubocop:todo Lint/Void
    expect(subject).to_not be_valid
  end

  it 'recent_comments should always return a total number of 5 comments' do
    expect(subject.comments_counter).to eq(subject.comments.last(5))
  end

  it 'update_posts_counter should increment the total posts by 1' do
    subject.posts_counter
    expect(subject.author.posts_counter).to eq 1
  end
end
