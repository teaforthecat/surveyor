class Api::V1::AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all.decorate
  end
end
