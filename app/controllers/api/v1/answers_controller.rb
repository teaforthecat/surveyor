class Api::V1::AnswersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
     @answer = Answer.build(answer_params)
     if @answer.save!
       if @answer.question.position == @answer.survey.questions.count
         @answer.assignment.touch(:completed_at)
       end
       head :no_content
     else
       render @answer
     end
  end

  private

  def answer_params
    params.require(:answer)
      .permit(:question_id, :assignment_id, :content)
      .merge(user_id: current_user.id)
  end

  def current_user
    User.first
  end

end
