Given(/^the statistics have been generated$/) do
  Organisation.create!(title: "All Organisations")
  Organisation.create!(title: "All data.gov.uk organisations")
    
  generator = StatisticsGenerator.new
  generator.generate_all
end
