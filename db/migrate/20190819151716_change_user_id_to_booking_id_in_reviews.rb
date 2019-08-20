class ChangeUserIdToBookingIdInReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user
    add_reference :reviews, :booking, foreign_key: true
  end
end
