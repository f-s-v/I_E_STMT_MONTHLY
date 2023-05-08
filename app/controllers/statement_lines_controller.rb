class StatementLinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_statement_line, only: %i[ show edit update destroy ]

  # GET /statement_lines or /statement_lines.json
  def index
    @statement_lines = current_user.statement_lines.group_by(&:kind)
  end

  # GET /statement_lines/1 or /statement_lines/1.json
  def show
  end

  # GET /statement_lines/new
  def new
    @statement_line = current_user.statement_lines.new
  end

  # GET /statement_lines/1/edit
  def edit
  end

  # POST /statement_lines or /statement_lines.json
  def create
    @statement_line = current_user.statement_lines.new(statement_line_params)

    respond_to do |format|
      if @statement_line.save
        format.html { redirect_to statement_lines_url, notice: "Statement line was successfully created." }
        format.json { render :show, status: :created, location: @statement_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @statement_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statement_lines/1 or /statement_lines/1.json
  def update
    respond_to do |format|
      if @statement_line.update(statement_line_params)
        format.html { redirect_to statement_line_url(@statement_line), notice: "Statement line was successfully updated." }
        format.json { render :show, status: :ok, location: @statement_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @statement_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statement_lines/1 or /statement_lines/1.json
  def destroy
    @statement_line.destroy

    respond_to do |format|
      format.html { redirect_to statement_lines_url, notice: "Statement line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement_line
      @statement_line = current_user.statement_lines.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statement_line_params
      params.require(:statement_line).permit(:amount, :title, :kind)
    end
end
