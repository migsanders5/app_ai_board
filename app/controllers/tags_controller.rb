class TagsController < ApplicationController
  def index
    matching_tags = Tag.all

    @list_of_tags = matching_tags.order({ :created_at => :desc })

    render({ :template => "tag_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tags = Tag.where({ :id => the_id })

    @the_tag = matching_tags.at(0)

    render({ :template => "tag_templates/show" })
  end

  def create
    the_tag = Tag.new
    the_tag.job_id = params.fetch("query_job_id")
    the_tag.tag = params.fetch("query_tag")

    if the_tag.valid?
      the_tag.save
      redirect_to("/jobs/#{the_tag.job_id}", { :notice => "Tag created successfully." })
    else
      redirect_to("/jobs/#{the_tag.job_id}", { :alert => the_tag.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tag = Tag.where({ :id => the_id }).at(0)

    the_tag.job_id = params.fetch("query_job_id")
    the_tag.tag = params.fetch("query_tag")

    if the_tag.valid?
      the_tag.save
      redirect_to("/tags/#{the_tag.id}", { :notice => "Tag updated successfully." } )
    else
      redirect_to("/tags/#{the_tag.id}", { :alert => the_tag.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tag = Tag.where({ :id => the_id }).at(0)

    the_job_id = the_tag.job_id
    the_tag.destroy

    redirect_to("/jobs/#{the_job_id}", { :notice => "Tag deleted successfully." } )
  end
end
