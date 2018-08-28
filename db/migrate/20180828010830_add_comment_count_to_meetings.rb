class AddCommentCountToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :comments_count, :integer, default: 0, null: false

    Meeting.pluck(:id).each do |id|
      Meeting.reset_counters(id, :comments)
    end
  end
end
