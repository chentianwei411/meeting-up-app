class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @meeting = Meeting.find(params['meeting_id'])

    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.meeting_id = @meeting.id
    respond_to do |format|
      if @comment.save
        # Meeting.update_counters(@meeting.id, comments_countz: 1)
        format.html { redirect_to meeting_path(@meeting) }
        # format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        # format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
