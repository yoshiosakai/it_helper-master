require 'csv'

class PcModelController < ApplicationController

  def index
    @pc_models = PcModel.all
    @reports = Report.all

    @reports.each do |report|
      if PcModel.where(pc_name: report.machine_number.downcase).present?
        id = PcModel.where(pc_name: report.machine_number.downcase).id
        report.pc_model = PcModel.find(id).pc_model
      end
    end
  end

  def import
    PcModel.import(params[:file])

    p "********"
    p PcModel.find(1)
    p "********"
    redirect_to "/pc_model/index"
  end
end
