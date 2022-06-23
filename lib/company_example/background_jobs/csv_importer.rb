class CompanyExample::BackgroundJobs::CsvImporter
  require 'csv'
  include Sidekiq::Worker

  def perform(csv_file)
    interector = CompanyExample::Interectors::AddCompany.new
    errors = []
    success = []
    CSV.foreach(csv_file, headers: true).with_index(1) do |row, ln|
      row = row.to_h
      company = row.transform_keys(&:to_sym)
      @company = interector.call(company)
      if @company.save
        success << @company
      else
        errors << { line: ln, errors: @company.errors }
      end
    end
    puts "Notify Success: #{success}"
    puts "Notify Errors: #{errors}"
  end
end
