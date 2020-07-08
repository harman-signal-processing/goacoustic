require 'helper'

describe Acoustic::Client::Contact do
  before do
    @client = Acoustic::Client.new({access_token: "abc123",url: 'https://api-campaign-us-1.goacoustic.com'})
  end

  describe "#add_recipient" do
    it "should add a recipient to an existing database" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><AddRecipient><LIST_ID>123</LIST_ID><CREATED_FROM>1</CREATED_FROM><CONTACT_LISTS><CONTACT_LIST_ID>456</CONTACT_LIST_ID></CONTACT_LISTS><COLUMN><NAME>email</NAME><VALUE>test@example.com</VALUE></COLUMN></AddRecipient></Body></Envelope>").
          to_return(:status => 200, :body => fixture("contact.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.add_recipient({email:"test@example.com"}, 123, [456])
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end

    it "should add a recipient to an existing database with options" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><AddRecipient><LIST_ID>123</LIST_ID><CREATED_FROM>1</CREATED_FROM><CONTACT_LISTS><CONTACT_LIST_ID>456</CONTACT_LIST_ID></CONTACT_LISTS><UPDATE_IF_FOUND>true</UPDATE_IF_FOUND><COLUMN><NAME>email</NAME><VALUE>test@example.com</VALUE></COLUMN></AddRecipient></Body></Envelope>").
          to_return(:status => 200, :body => fixture("contact.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.add_recipient({email:"test@example.com"}, 123, [456], 1, {UPDATE_IF_FOUND: "true"})
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end

  end
end
