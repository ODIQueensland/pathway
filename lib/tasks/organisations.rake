require 'organisation_importer'

namespace :organisations do

  desc "Imports organisations from the data.gov.uk hierarchy"
  task :import => :environment do
    response = Net::HTTP.get_response("data.gov.uk","/api/action/group_tree?type=organization")
    json = JSON.parse(response.body)
    results = json['result']
    puts "#{results.length} top level organisations found"
    OrganisationImporter.populate(results)
  end
  
end