require_relative '../lib/niconico'

nico = Niconico.new('email', 'password')
nico.agent.request_headers = {
  'accept-language' => 'ja, ja-JP, en',
  'accept-encoding' => 'utf-8, us-ascii'
}
video = nico.video('sm9')

puts "title=#{video.title}"
open("#{video.title}.#{video.type}", 'w+b') { |file|
  file.print video.get_video
}
