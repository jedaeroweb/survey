class SurveysController < ApplicationController
    load_and_authorize_resource except: [:index, :create]
    before_action :set_survey, only: [:show, :edit, :update, :destroy]

    # GET /surveys
    # GET /notsurveysices.json
    def index
    end

    # GET /surveys/1
    # GET /surveys/1.json
    def show
      @question_categories = QuestionCategory.where(survey_id: @survey).order('id desc').all
    end


    # GET /surveys/new
    # GET /surveys/new.json
    def new
      @survey = Survey.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @question }
        end
    end

    # GET /surveys/1/edit
    def edit

    end

    # POST /surveys
    # POST /surveys.json
    def create
      @survey = Survey.new(survey_params)

        respond_to do |format|
            if @survey.save
                format.html { redirect_to survey_path(@survey), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @survey, status: :created, location: @survey }
            else
                format.html { render action: 'new' }
                format.json { render json: @survey.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /surveys/1
    # PATCH/PUT /surveys/1.json
    def update
        respond_to do |format|
            if @survey.update(survey_params)

                format.html { redirect_to survey_path(@survey), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @survey }
            else
                format.html { render :edit }
                format.json { render json: @survey.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /surveys/1
    # DELETE /surveys/1.json
    def destroy
      @survey.destroy
        respond_to do |format|
            format.html { redirect_to surveys_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between surveys.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
        params.require(:survey).permit(:question_category_id, :title, :enable)
    end
end
