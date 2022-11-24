class SearchCompanyWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(company_id)
    company = Company.find_by(id: company_id)

    if company.blank?
      notify(message: "Company not found.", success: false)
      return
    end

    process(company)
  end


  private

  def process(company)
    api_client = ChuckNorris::Client.new
    random = api_client.random
    company.update(name: FFaker::CompanyIT.name)
    notify(message: "Updated with success.")
  end

  def notify(message:, success: true)
    if success
      puts "========= #{message} =========="
      logger.info message
    else
      logger.error message
    end
  end
end