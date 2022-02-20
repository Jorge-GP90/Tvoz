class StudentAudiosController < ApplicationController
  before_action :set_student_audio, only: %i[ show edit update destroy ]

  # GET /student_audios or /student_audios.json
  def index
    @student_audios = StudentAudio.all
  end

  # GET /student_audios/1 or /student_audios/1.json
  def show
  end

  # GET /student_audios/new
  def new
    @student_audio = StudentAudio.new
  end

  # GET /student_audios/1/edit
  def edit
  end

  # POST /student_audios or /student_audios.json
  def create
    @student_audio = StudentAudio.new(student_audio_params)

    respond_to do |format|
      if @student_audio.save
        format.html { redirect_to student_audio_url(@student_audio), notice: "Student audio was successfully created." }
        format.json { render :show, status: :created, location: @student_audio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_audios/1 or /student_audios/1.json
  def update
    respond_to do |format|
      if @student_audio.update(student_audio_params)
        format.html { redirect_to student_audio_url(@student_audio), notice: "Student audio was successfully updated." }
        format.json { render :show, status: :ok, location: @student_audio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_audios/1 or /student_audios/1.json
  def destroy
    @student_audio.destroy

    respond_to do |format|
      format.html { redirect_to student_audios_url, notice: "Student audio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_audio
      @student_audio = StudentAudio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_audio_params
      params.require(:student_audio).permit(:audio_student, :user_id, :task_id)
    end
end
