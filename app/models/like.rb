class Like < ActiveRecord::Base
  belongs_to :author
  belongs_to :post

  after_save :update_likes_counter

  private

  def update_likes_counter
    author.increment!(:likes_counter)
  end
end
