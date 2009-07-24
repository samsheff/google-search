
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::Image do
  before :each do
    @search = Google::Search::Image.new :query => 'foo'  
  end
  
  describe "#get_uri" do
    describe "size" do
      it "should validate" do
        @search.size = :icon
        @search.get_uri.should include('imgsz=icon')
        @search.size = :foo
        lambda { @search.get_uri }.should raise_error(Google::Search::Error, /size/)
      end
    end
    
    describe "color" do
      it "should validate" do
        @search.color = 'blue'
        @search.get_uri.should include('imgcolor=blue')
      end
    end
    
    describe "image_type" do
      it "should validate" do
        @search.image_type = :lineart
        @search.get_uri.should include('imgtype=lineart')
        @search.image_type = :foo
        lambda { @search.get_uri }.should raise_error(Google::Search::Error, /image_type/)
      end
    end
    
    describe "file_type" do
      it "should validate" do
        @search.file_type = :jpg
        @search.get_uri.should include('as_filetype=jpg')
        @search.file_type = :foo
        lambda { @search.get_uri }.should raise_error(Google::Search::Error, /file_type/)
      end
    end
    
    describe "uri" do
      it "should validate" do
        @search.uri = 'http://foo.com'
        @search.get_uri.should include('as_sitesearch=http%3A%2F%2Ffoo.com')
      end
    end
  end
end