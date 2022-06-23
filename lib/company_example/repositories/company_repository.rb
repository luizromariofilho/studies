class CompanyExample::Repositories::CompanyRepository
  def initialize(model_class: Company)
    @model_class = model_class
  end

  def create(attributes)
    @model_class.new(attributes)
  end
end
