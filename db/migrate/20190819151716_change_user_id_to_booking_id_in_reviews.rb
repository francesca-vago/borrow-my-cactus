class ChangeUserIdToBookingIdInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :user_id, :booking_id
  end
end
