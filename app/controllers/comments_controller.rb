class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all

    @list_of_comments = matching_comments.order({ :created_at => :desc })

    render({ :template => "comment_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comment_templates/show" })
  end

  def create
    the_comment = Comment.new
    the_comment.article_id = params.fetch("query_article_id")
    the_comment.user_id = current_user.id
    the_comment.comment = params.fetch("query_comment")

    if the_comment.valid?
      the_comment.save
      redirect_to("/articles/#{the_comment.article_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/articles/#{the_comment.article_id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.article_id = params.fetch("query_article_id")
    the_comment.user_id = params.fetch("query_user_id")
    the_comment.comment = params.fetch("query_comment")

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/#{the_comment.id}", { :notice => "Comment updated successfully." } )
    else
      redirect_to("/comments/#{the_comment.id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_article_id = the_comment.article_id
    the_comment.destroy

    redirect_to("/articles/#{the_article_id}", { :notice => "Comment deleted successfully." } )
  end
end
