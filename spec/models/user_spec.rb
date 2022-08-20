require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ghilain', photo: 'https://unsplash.com/photos/XPTwNe15dtw', bio: 'web developer') }
  before { subject.save }

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be an integer minimum is zero' do
    subject.posts_counter < -1
    expect(subject).to_not be_valid
  end
end
