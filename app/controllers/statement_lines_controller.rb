class StatementLinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_statement_line, only: %i[ show edit update destroy ]

  def index
    @statement_lines = current_user.statement_lines.group_by(&:kind)
  end

  def new
    @statement_line = current_user.statement_lines.new
  end

  def edit
  end

  def create
    @statement_line = current_user.statement_lines.new(statement_line_params)

    respond_to do |format|
      if @statement_line.save
        format.html { redirect_to statement_lines_url, notice: "Statement line was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @statement_line.destroy

    respond_to do |format|
      format.html { redirect_to statement_lines_url, notice: "Statement line was successfully destroyed." }
    end
  end

  private
    def set_statement_line
      @statement_line = current_user.statement_lines.find(params[:id])
    end

    def statement_line_params
      params.require(:statement_line).permit(:amount, :title, :kind)
    end
end
