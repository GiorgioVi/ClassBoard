class QuestionsController < ApplicationController
  def index
    matching_questions = Question.all

    @list_of_questions = matching_questions.order({ :created_at => :desc })

    render({ :template => "questions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_questions = Question.where({ :id => the_id })

    @the_question = matching_questions.at(0)

    render({ :template => "questions/show.html.erb" })
  end

  def create
    the_question = Question.new
    the_question.description = params.fetch("query_description")
    the_question.image_link = params.fetch("query_image_link")
    the_question.user_id = params.fetch("query_user_id")
    the_question.image_file = params.fetch("query_image_file")
    the_question.course_id = params.fetch("query_course_id")

    if the_question.valid?
      the_question.save
      redirect_to("/questions/"+the_question.id.to_s, { :notice => "Question created successfully." })
    else
      redirect_to("/home_page", { :notice => "Question failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.description = params.fetch("query_description")
    the_question.image_link = params.fetch("query_image_link")
    the_question.user_id = params.fetch("query_user_id")
    the_question.image_file = params.fetch("query_image_file")
    the_question.course_id = params.fetch("query_course_id")

    if the_question.valid?
      the_question.save
      redirect_to("/questions/#{the_question.id}", { :notice => "Question updated successfully."} )
    else
      redirect_to("/questions/#{the_question.id}", { :alert => "Question failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.destroy

    redirect_to("/questions", { :notice => "Question deleted successfully."} )
  end

  def show_user_questions
    
    render({ :template => "questions/user_questions.html.erb" })

  end
end
