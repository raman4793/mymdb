class ChangeModerationStateInThreaddedUserDetails < ActiveRecord::Migration[5.0]
  def change
    change_column_default :thredded_user_details, :moderation_state, 1
  end
end
