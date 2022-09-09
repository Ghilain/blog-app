require 'rails_helper'
RSpec.describe 'Users pages test', type: :feature do
  describe 'index page' do
    before :each do
      @user_first = User.new(name: 'Pascal',
                             # rubocop:todo Layout/LineLength
                             photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'Teacher from Rwanda.', posts_counter: 0)
      # rubocop:enable Layout/LineLength
      @user_second = User.create(name: 'Ishimwe',
                                 # rubocop:todo Layout/LineLength
                                 photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'A beautiful lady', posts_counter: 1)
      # rubocop:enable Layout/LineLength
      @user_third = User.create(name: 'Ghilain',
                                # rubocop:todo Layout/LineLength
                                photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'A good guy', posts_counter: 2)
      # rubocop:enable Layout/LineLength
    end
    it 'check users#index path' do
      visit '/'
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Ghilain')
    end
    it 'Should display all user names' do
      visit '/'
      expect(page).to have_content('Ishimwe')
      expect(page).to have_content('Ghilain')
    end
    it 'Should set the link of the picture to the img src' do
      visit '/'
      all('img').each do |i|
        expect(i[:src]).to eq('https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80')
      end
    end
    it 'Should display the total post number of users' do
      visit '/'
      expect(page).to have_content(1)
      expect(page).to have_content(1)
      expect(page).to have_content(2)
    end
  end
  describe 'show page' do
    before :each do
      @user_first = User.create(name: 'Pascal', photo: 'pic.png', bio: 'Teacher from Rwanda.', posts_counter: 2)
      @post_first = @user_first.posts.new(title: 'Love must lead', text: 'This is my first post')
      @post_first.likes_counter = 0
      @post_first.comments_counter = 0
      @post_first.update_posts_counter
      @post_first.save
      @post_second = @user_first.posts.new(title: 'Being a good child', text: 'This is my second post')
      @post_second.likes_counter = 0
      @post_second.comments_counter = 0
      @post_second.update_posts_counter
      @post_second.save
      @post_third = @user_first.posts.new(title: 'Going to school', text: 'This is my third post')
      @post_third.likes_counter = 0
      @post_third.comments_counter = 0
      @post_third.update_posts_counter
      @post_third.save
    end
    it 'check users#show path' do
      visit user_path(@user_first.id)
      expect(current_path).to eq(user_path(@user_first.id))
      expect(page).to have_text('Teacher from Rwanda.')
    end
    it 'Should display the user name' do
      visit user_path(@user_first.id)
      expect(page).to have_content('Pascal')
    end
    it 'Should display user bio' do
      visit user_path(@user_first.id)
      expect(page).to have_content('Teacher from Rwanda.')
    end
    it 'Should display the user first 3 posts' do
      visit user_path(@user_first.id)
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
    end
    it 'Should display a button with "See All Posts" text' do
      visit user_path(@user_first.id)
      expect(page).to have_link('See All Posts')
    end
    it 'Should redirect to post page after clicking on "See All Posts"' do
      visit user_path(@user_first.id)
      click_link 'See All Posts'
      expect(current_path).to eq(user_posts_path(@user_first.id))
    end
  end
end
