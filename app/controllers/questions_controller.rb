class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @questions = Question.all
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: 'saved'
    else
      render json: 'question.errors.full_messages'
    end
  end

  def destroy
    Question.find(params[:id]).delete
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:name, :email, :subject, :message)
  end
end
