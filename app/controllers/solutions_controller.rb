class SolutionsController < ApplicationController
  def index
    matching_solutions = Solution.all

    @list_of_solutions = matching_solutions.order({ :created_at => :desc })

    render({ :template => "solutions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_solutions = Solution.where({ :id => the_id })

    @the_solution = matching_solutions.at(0)

    render({ :template => "solutions/show.html.erb" })
  end

  def create
    the_solution = Solution.new
    the_solution.description = params.fetch("query_description")
    the_solution.image_link = params.fetch("query_image_link")
    the_solution.user_id = params.fetch("query_user_id")
    the_solution.image_file = params.fetch("query_image_file")
    the_solution.question_id = params.fetch("query_question_id")
    the_solution.vote_count = params.fetch("query_vote_count")
    the_solution.course_id = params.fetch("query_course_id")

    if the_solution.valid?
      the_solution.save
      redirect_to("/questions/"+the_solution.question_id.to_s, { :notice => "Solution created successfully." })
    else
      redirect_to("/solutions", { :notice => "Solution failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_solution = Solution.where({ :id => the_id }).at(0)

    the_solution.description = params.fetch("query_description")
    the_solution.image_link = params.fetch("query_image_link")
    the_solution.user_id = params.fetch("query_user_id")
    the_solution.image_file = params.fetch("query_image_file")
    the_solution.question_id = params.fetch("query_question_id")
    the_solution.vote_count = params.fetch("query_vote_count")
    the_solution.course_id = params.fetch("query_course_id")

    if the_solution.valid?
      the_solution.save
      redirect_to("/solutions/#{the_solution.id}", { :notice => "Solution updated successfully."} )
    else
      redirect_to("/solutions/#{the_solution.id}", { :alert => "Solution failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_solution = Solution.where({ :id => the_id }).at(0)

    the_solution.destroy

    redirect_to("/solutions", { :notice => "Solution deleted successfully."} )
  end

  def show_user_solutions
    render({ :template => "solutions/show_user_solutions.html.erb" })
  end
end
