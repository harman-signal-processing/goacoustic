require 'helper'

describe Acoustic::Client::Reporting do
  before do
    @client = Acoustic.new({access_token: "abc123",url: 'https://api-campaign-us-1.goacoustic.com'})
  end

  describe ".get_sent_mailings_for_org" do
    it "returns the mailingId for the given dates" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><GetSentMailingsForOrg><DATE_START>1/1/2014 00:00:00</DATE_START><DATE_END>1/2/2014 23:59:59</DATE_END></GetSentMailingsForOrg></Body></Envelope>").
        to_return(:status => 200, :body => fixture('sent_mailings_org.xml'), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.get_sent_mailings_for_org("1/1/2014 00:00:00", "1/2/2014 23:59:59")
      expect(resp.Envelope.Body.RESULT.Mailing[0].MailingId).to eql "5758"
    end

    it "returns the mailingId for the given dates when passing an option" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><GetSentMailingsForOrg><PRIVATE/><DATE_START>1/1/2014 00:00:00</DATE_START><DATE_END>1/2/2014 23:59:59</DATE_END></GetSentMailingsForOrg></Body></Envelope>").
        to_return(:status => 200, :body => fixture('sent_mailings_org.xml'), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.get_sent_mailings_for_org("1/1/2014 00:00:00", "1/2/2014 23:59:59", {PRIVATE: nil})
      expect(resp.Envelope.Body.RESULT.Mailing[0].MailingId).to eql "5758"
    end

    it "returns the SentMailingCount" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><GetSentMailingsForOrg><MAILING_COUNT_ONLY/><DATE_START>1/1/2014 00:00:00</DATE_START><DATE_END>1/2/2014 23:59:59</DATE_END></GetSentMailingsForOrg></Body></Envelope>").
        to_return(:status => 200, :body => "<Envelope><Body><RESULT><SUCCESS>TRUE</SUCCESS><SentMailingsCount>5758</SentMailingsCount></RESULT></Body></Envelope>", :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.get_sent_mailings_for_org("1/1/2014 00:00:00", "1/2/2014 23:59:59", {MAILING_COUNT_ONLY: nil})
      expect(resp.Envelope.Body.RESULT.SentMailingsCount).to eql "5758"
    end

  end

  describe ".raw_recipient_data_export" do
    it "should return true when passing a MAILING_ID" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><RawRecipientDataExport><MAILING><MAILING_ID>1234</MAILING_ID></MAILING></RawRecipientDataExport></Body></Envelope>").
          to_return(:status => 200, :body => fixture("reporting.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})


      resp = @client.raw_recipient_data_export({MAILING_ID: 1234})
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end

    it "should return true when passing a REPORT_ID" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><RawRecipientDataExport><MAILING><REPORT_ID>5678</REPORT_ID></MAILING></RawRecipientDataExport></Body></Envelope>").
          to_return(:status => 200, :body => fixture("reporting.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})


      resp = @client.raw_recipient_data_export({REPORT_ID: 5678})
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end

    it "should return true when passing a EVENT_DATE_START and EVENT_DATE_END" do
      stub_post("/XMLAPI").
         with(:body => "<Envelope><Body><RawRecipientDataExport><EVENT_DATE_START>1/1/2013</EVENT_DATE_START><EVENT_DATE_END>7/1/2013</EVENT_DATE_END></RawRecipientDataExport></Body></Envelope>").
          to_return(:status => 200, :body => fixture("reporting.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})


      resp = @client.raw_recipient_data_export({EVENT_DATE_START: "1/1/2013", EVENT_DATE_END: "7/1/2013"})
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end

    it "should return true when passing options" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><RawRecipientDataExport><MAILING><MAILING_ID>1234</MAILING_ID></MAILING><MOVE_TO_FTP/></RawRecipientDataExport></Body></Envelope>").
          to_return(:status => 200, :body => fixture("reporting.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.raw_recipient_data_export({MAILING_ID: 1234},{MOVE_TO_FTP: nil})
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end

    it "should return true when passing extra columns to export" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><RawRecipientDataExport><MAILING><MAILING_ID>1234</MAILING_ID></MAILING><COLUMNS><COLUMN><NAME>CustomerID</NAME></COLUMN><COLUMN><NAME>Address</NAME></COLUMN></COLUMNS></RawRecipientDataExport></Body></Envelope>").
          to_return(:status => 200, :body => fixture("reporting.xml"), :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})

      resp = @client.raw_recipient_data_export({MAILING_ID: 1234},{}, ["CustomerID", "Address"])
      expect(resp.Envelope.Body.RESULT.SUCCESS).to eql "TRUE"
    end
  end

  describe ".get_job_status" do
    it "returns the job_status for the given job_id" do
      stub_post("/XMLAPI").
        with(:body => "<Envelope><Body><GetJobStatus><JOB_ID>1234</JOB_ID></GetJobStatus></Body></Envelope>").
          to_return(:status => 200, :body => '<Envelope><Body><RESULT><SUCCESS>TRUE</SUCCESS>
                    <JOB_ID>1234</JOB_ID><JOB_STATUS>COMPLETE</JOB_STATUS>
                    <JOB_DESCRIPTION> Creating new contact source, Master Database</JOB_DESCRIPTION>
                    <PARAMETERS><PARAMETER><NAME>NOT_ALLOWED</NAME><VALUE>0</VALUE></PARAMETER></PARAMETERS>
                    </RESULT></Body></Envelope>', :headers => {'Content-type' => "text/xml", 'Authorization' => 'Bearer abc123'})


      resp = @client.get_job_status(1234)
      expect(resp.Envelope.Body.RESULT.JOB_STATUS).to eql "COMPLETE"
    end
  end

end
