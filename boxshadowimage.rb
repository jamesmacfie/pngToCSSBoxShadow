require 'rubygems'
require 'chunky_png'

module Sass::Script::Functions
  def boxShadowImage(file)
    assert_type file, :String
    returnString = ""
    image = ChunkyPNG::Image.from_file(file.value)
    (0..image.dimension.width-1).each do |x|
      (0..image.dimension.height-1).each do |y|
        r = ChunkyPNG::Color.r(image[x,y]).to_s
        g = ChunkyPNG::Color.g(image[x,y]).to_s
        b = ChunkyPNG::Color.b(image[x,y]).to_s
        returnString << x.to_s + 'px ' + y.to_s + 'px 0 rgb(' + r + ", " + g + ", " + b + "),"
      end
    end

    Sass::Script::Value::String.new(returnString[0...-1])
  end
  declare :boxShadowImage, [:string]
end
