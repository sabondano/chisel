require './test/test_helper'
require 'image_renderer'
require 'pry'

class ImagesRendererTest < Minitest::Test
  def test_one_image_in_one_line_without_title_attribute
    input = "![Alt text](/path/to/img.jpg)"
    expected = "<img src='/path/to/img.jpg' alt='Alt text'/>"

    output = ImageRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_one_image_in_one_line_with_title_attribute
    input = "![Alt text](/path/to/img.jpg 'Optional title')"
    expected = "<img src='/path/to/img.jpg' alt='Alt text' title='Optional title'/>"

    output = ImageRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_two_images_in_two_lines_with_title_attribute
    input = "![Alt text](/path/to/img.jpg 'Optional title')\n![Alt text for image 2](/path/to/img2.jpg 'Optional title number 2')"
    expected = "<img src='/path/to/img.jpg' alt='Alt text' title='Optional title'/><img src='/path/to/img2.jpg' alt='Alt text for image 2' title='Optional title number 2'/>"
    output = ImageRenderer.new.parse(input)

    assert_equal expected, output
  end
end