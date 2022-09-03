class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post
  after_save :update_comments_counter

  private

  def update_comments_counter
    author.increment!(:comments_counter)
  end
end
