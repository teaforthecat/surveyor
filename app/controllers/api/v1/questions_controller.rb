class Api::V1::QuestionsController < ApplicationController

  before_action :assignment

  def index
    @questions = @assignment.questions
  end


  def assignment
    @assignment = Assignment.find(params[:assignment_id])
  end


end
