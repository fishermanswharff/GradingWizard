class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def nomnom
    binding.pry
    payload = JSON.parse(params[:payload])
  end

  def create
    @report = Report.new(reports_params)
  end

  private
  def reports_params
    params.require(:reports).permit(:payload)
  end
end