RSpec.describe 'Post pages test', type: :feature do
  describe 'index page' do
    before :each do
      @user_first = User.create(name: 'Clara',
                                # rubocop:todo Layout/LineLength
                                photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'A cute baby', posts_counter: 0)
      # rubocop:enable Layout/LineLength
      @post_first = Post.new(author: @user_first, title: 'Love must lead', text: 'This is my first post',
                             comments_counter: 0, likes_counter: 0)
      @post_first.update_posts_counter
      @post_first.save

      @comment = Comment.new(post: @post_first, author: @user_first, text: 'Hi Tom!')
      @comment.update_comments_counter
      @comment.save

      @like = Like.new(author_id: @user_first.id, post_id: @post_first.id)
      @like.save
      @like.update_likes_counter
    end

    it 'Should set the link of the picture to the img src' do
      visit user_posts_path(@user_first.id)
      all('img').each do |i|
        expect(i[:src]).to eq('https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80')
      end
    end

    it 'Should display the user name' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Clara')
    end

    it 'Should display the total post number of 1' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Number of posts: 1')
    end

    it 'Should display the post title' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Love must lead')
    end

    it 'Should display the post body' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('This is my first post')
    end

    it 'Should display the post comment' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Hi Tom!')
    end

    it 'Should display the total post comment number of 1' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content(1)
    end

    it 'Should display the total post likes number of 1' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content(1)
    end

    it 'Should redirect to post show page after clicking on a post' do
      visit user_posts_path(@user_first.id)
      click_link 'Love must lead'
      expect(current_path).to eq(user_post_path(@user_first.id, @post_first.id))
    end
  end

  describe 'show page' do
    before :each do
      @user_first = User.create(name: 'Clara', photo: 'mybaby.png', bio: 'A cute baby', posts_counter: 0)

      @post_first = Post.new(author: @user_first, title: 'Love must lead', text: 'This is my first post',
                             comments_counter: 0, likes_counter: 0)
      @post_first.update_posts_counter
      @post_first.save

      @comment = Comment.new(post: @post_first, author: @user_first, text: 'Hi Tom!')
      @comment.update_comments_counter
      @comment.save

      @like = Like.new(author_id: @user_first.id, post_id: @post_first.id)
      @like.save
      @like.update_likes_counter
    end

    it 'Should display the post title' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Love must lead')
    end

    it 'Should display who wrote the post' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Clara')
    end

    it 'Should display the total post comment number of 1' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content(1)
    end

    it 'Should display the total post likes number of 1' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content(1)
    end

    it 'Should display the post body' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('This is my first post')
    end

    it 'Should display the name of the user who posted a comment' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Clara')
    end

    it 'Should display the post comment text of a user' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Hi Tom!')
    end
  end
end
