class QuestionsController < ApiBaseController
  before_action :authenticate_user
  

  def index
    questions = Question.all
    if questions.empty?
      render status: :no_content
    else
      render json: questions
    end
  end

  def create
    if Question.exists? :text => params[:text]
        render :json=>{:text=>"Alredy exists"}
        return
    end
    question = Question.create(user_id: params[:user_id],
                               text: params[:text],
                               answer: params[:answer],
                               category_id: params[:category_id],
                               test: params[:test])
    if !question.errors.blank?
      render json: question.errors, status: :bad_request
      return
    end
    if params[:test]
      params[:test_answers].each do |ans|
        test_answer = TestAnswer.create(question_id: question.id, answer: ans)
        if !test_answer.errors.blank?
          render json: test_answer.errors, status: :bad_request
          return
        end
      end
    end
    render json: question, :include=>:test_answers
  end

  def show
    question = Question.find_by_id(params[:id])
    if question.errors.blank?
      render json: question, :include=>:test_answers
    else
      render json: question.errors, status: :bad_request
    end
  end
end
