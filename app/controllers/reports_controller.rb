class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :destroy]

  def settled
    @reports = Report.all
  end


  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @report.date = Date.today.strftime("%Y/%m/%d")
    @report.time = Time.now.strftime("%H:%M")
    set_FAQ
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @faq = Array[
      "ネットワークに繋がらない",
      "画面が映らない",
      "電源が入らない",
      "その他"
    ]

    @report = Report.new(report_params)

    file1 = params[:report][:file1]
    file2 = params[:report][:file2]
    file3 = params[:report][:file3]
    file4 = params[:report][:file4]

    if !file1.nil?
      file_name = file1.original_filename
      File.open("public/image/#{file_name}",'wb'){|f| f.write(file1.read)}
      @report.file1 = file_name
    end

    if !file2.nil?
      file_name = file2.original_filename
      File.open("public/image/#{file_name}",'wb'){|f| f.write(file2.read)}
      @report.file2 = file_name
    end

    if !file3.nil?
      file_name = file3.original_filename
      File.open("public/image/#{file_name}",'wb'){|f| f.write(file3.read)}
      @report.file3 = file_name
    end

    if !file4.nil?
      file_name = file4.original_filename
      File.open("public/image/#{file_name}",'wb'){|f| f.write(file4.read)}
      @report.file4 = file_name
    end

    if @report.save
      #redirect_to notification_index_url(@report.urgency)
      redirect_to :controller=>'notification', :action=>'index',:name=>@report.name, :urgency=>@report.urgency
      #redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    if @report.update(report_params)
      redirect_to @report
    else
      render :edit
    end
  end

  def download
    @report = Report.find_by(id: params[:format])
    if params[:file]==="file1"
      filename = @report.file1
    elsif params[:file]==="file2"
      filename = @report.file2
    elsif params[:file]==="file3"
      filename = @report.file3
    elsif params[:file]==="file4"
      filename = @report.file4
    end
    filepath = Rails.root.join('public/image',filename)
    send_file(filepath, :filename => filename)
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    redirect_to reports_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    def set_FAQ
      @faq = Array[
        "ネットワークに繋がらない",
        "画面が映らない",
        "電源が入らない",
        "その他"
      ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(
        :id,
        :role, :name, :urgency, :date, :time, :machine_name, :machine_number, :problem, :problem_other, :cause, :try_solution,
        attached_files_attributes: [
          :filename => [],
        ],
        operator_attributes: [
          :id,
          :status, :name, :try_solution, :solution, :report_id
        ]
        )
    end

    def file_params
      params.require(:attached_files).permit({file_name: []})
    end
end
