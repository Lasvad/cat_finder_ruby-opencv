require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: ruby #{__FILE__} video_file_name_goes_here"
  exit
end

@video = nil
begin
  # image = CvMat.load(ARGV[0], CV_LOAD_IMAGE_COLOR) # Read the file.
  print "Capture Video\n"
  
  @video = CvCapture.open(ARGV[0])

  print @video
rescue
  puts 'Could not open or find the image.'
  exit
end

window = GUI::Window.new('Display window') # Create a window for display.

zora_dark_brown  = CvScalar.new  0x1C, 0x33, 0x4F
zora_light_brown = CvScalar.new  0x60, 0x71, 0x7C

zeke_light = CvScalar.new  0xE8, 0xFD, 0xFD
zeke_dark = CvScalar.new  0x71, 0x9B, 0xCB


#FDFDE8
#CB9B71

loop do

	begin
		image = @video.query
		# mask = image.in_range(zora_dark_brown, zora_light_brown)
		mask = image.in_range(zeke_dark, zeke_light)

		window.show(mask)
		# break if GUI::wait_key(1) != nil
	rescue
		break
	end

	
	

end
	
