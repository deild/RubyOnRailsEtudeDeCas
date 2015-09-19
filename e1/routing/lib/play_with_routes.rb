#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
def rs
  ActionController::Routing::Routes
end

class MockRequest
  attr_accessor :path, :path_parameters, :host, :subdomains, :domain, :method

  def initialize(values={})
    values.each { |key, value| send("#{key}=", value) }
    if values[:host]
      subdomain, self.domain = values[:host].split(/\./, 2)
      self.subdomains = [subdomain]
    end
  end
end

class MockController
  attr_accessor :routes

  def initialize(routes)
    self.routes = routes
  end

  def url_for(options)
    only_path = options.delete(:only_path)
    path = routes.generate(options)
    only_path ? path : "http://named.route.test#{path}"
  end
end

def request
  @request ||= MockRequest.new(:host => "named.routes.test", :method => :get)
end
