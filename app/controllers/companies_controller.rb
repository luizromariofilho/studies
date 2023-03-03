class CompaniesController < ApplicationController
  load_and_authorize_resource
  before_action :set_company, only: %i[show update destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show; end

  # POST /companies
  # POST /companies.json
  def create
    interector = CompanyExample::Interectors::AddCompany.new
    @company = interector.call(company_params.to_h)

    if @company.save
      render :show, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # POST /companies
  # POST /companies.json
  def upload
    interector = CompanyExample::Interectors::UploadCompany.new
    interector.call(params[:file])
    render json: { message: 'File have been uploaded' }, status: :ok
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      render :show, status: :ok, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name)
  end
end
