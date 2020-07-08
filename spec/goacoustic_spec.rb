require 'helper'

describe GoAcoustic do
  describe ".new" do
    it "should be a new GoAcoustic::Client" do
      expect(GoAcoustic.new).to be_a GoAcoustic::Client
    end
  end

  describe ".respond_to?" do
    pending it "should be true if method exists" do
      expect(GoAcoustic.respond_to?(:new, true)).to be_true
    end
  end
end
