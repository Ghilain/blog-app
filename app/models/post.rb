class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  has_many :likes
  after_save :update_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  public

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
