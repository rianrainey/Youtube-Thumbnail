class Video < ActiveRecord::Base
  before_save :create_image_link
  
  protected # Detail private functions below here
  
  def create_image_link
    puts "Video URL: " + self.video_url
    
    # Get YouTube ID. Assuming http://www.youtube.com/watch?v=YZi0a9O2WrA syntax
    @begin_pos = self.video_url.index("=")
    @link_substring = self.video_url[@begin_pos+1..-1] # get link url substring
    puts "Link Substring: " + @link_substring
    
    # Create Image URL. Assuming http://img.youtube.com/vi/YZi0a9O2WrA/0.jpg
    @link_url = "http://img.youtube.com/vi/" + @link_substring + "/0.jpg"
    puts "Link URL: " + @link_url
    self.image_url = @link_url
    puts "Image URL: " + self.image_url
  end
end
