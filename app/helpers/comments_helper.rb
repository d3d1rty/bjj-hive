module CommentsHelper
  def comment_reply_to_info(comment)
    "##{comment.id} / #{comment.user.handle}"
  end
end
