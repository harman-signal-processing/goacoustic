require 'helper'

describe Acoustic do
  describe ".new" do
    it "should be a new Acoustic::Client" do
      expect(Acoustic.new).to be_a Acoustic::Client
    end
  end

  describe ".respond_to?" do
    pending it "should be true if method exists" do
      expect(Acoustic.respond_to?(:new, true)).to be_true
    end
  end
end
