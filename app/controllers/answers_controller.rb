class AnswersController < InheritedResources::Base

  private

    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :assignment_id, :content)
    end

end
