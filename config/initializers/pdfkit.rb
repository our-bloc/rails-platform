# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/rvm/gems/ruby-2.3.0/bin/wkhtmltopdf'
  config.default_options = {
    :print_media_type => true
  }


 ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}
end