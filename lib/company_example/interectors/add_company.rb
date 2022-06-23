class CompanyExample::Interectors::AddCompany
  attr_accessor :company

  def initialize(repository: CompanyExample::Repositories::CompanyRepository.new)
    @repository = repository
  end

  def call(attributes)
    @company = @repository.create(attributes)
  end
end
