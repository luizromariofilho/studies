class CompanyExample::Interectors::UploadCompany
  attr_accessor :company

  def initialize(repository: CompanyExample::Repositories::CompanyRepository.new)
    @repository = repository
  end

  def call(csv_file)
    dir = Rails.root.join('tmp', 'uploads')
    # creates the folder uploads if it dosen’t exist
    Dir.mkdir(dir) unless Dir.exist?(dir)
    # generate random name of the file
    file_name = "#{rand(34_999_999)}_file"
    # reading from the uploaded file and writing to new file
    File.open(dir.join(file_name), 'wb') do |file|
      file.write(csv_file.read)
    end

    importer = CompanyExample::BackgroundJobs::CsvImporter
    importer.perform_async(dir.join(file_name).to_s)
  end
end
