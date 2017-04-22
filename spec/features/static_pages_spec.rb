# spec/features/static_pages_spec.rb

require_relative '../spec_helper'

valid_pages   = ['datenschutz.html', 'nutzung.html', 'privacy.html', 'terms.html']
invalid_pages = ['', 'index.html', 'index.htm', 'impressum.html', 'contact.html']
     
describe 'Static pages' do

  valid_pages.each do |page|
    it "should deliver /#{page}" do  
      get '/' + page
      expect(last_response).to be_ok
      expect(last_response.length).to be > 0
    end
  end   
  
  invalid_pages.each do |page| 
    it "should _not_ deliver /#{page}" do  
       get '/' + page 
       expect(last_response.status).to be 404
     end         
  end

end