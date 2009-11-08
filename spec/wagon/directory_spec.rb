require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Wagon::Directory" do
  
  before(:each) do
    @page = Wagon::Directory.new($user, $user.ward.directory_path, $user.ward)
  end
  
  it "should find the photo directory link" do
    @page.photo_directory_path.should_not be_nil
    @page.photo_directory_path.should match(%r{^/units/a/directory/photoprint})
  end
  
  it "should be able to generate a pdf" do
    @page.to_pdf.render_file("./photo_directory.pdf")
  end
  
end
