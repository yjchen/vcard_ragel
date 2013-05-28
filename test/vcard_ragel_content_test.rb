require 'vcard_content_tokenizer'
require 'minitest/autorun'

class TestVCardContentTokenizer < MiniTest::Test
  def setup
  end

  def test_content_one_exact
    path = "test/data/content_one_exact.vcf"
    t = VCardRegal::ContentTokenizer.new(path)
    t.perform do |content, version|
      assert_equal "4.0", version
      assert_equal "abc\n", content
    end
  end

  def test_content_one_extra
    path = "test/data/content_one_extra.vcf"
    t = VCardRegal::ContentTokenizer.new(path)
    t.perform do |content, version|
      assert_equal "4.0", version
      assert_equal "not real END:VCARD\n", content
    end
  end

  def test_content_multi_exact
    path = "test/data/content_multi_exact.vcf"
    t = VCardRegal::ContentTokenizer.new(path)
    contents = Array.new
    t.perform do |content, version|
      assert_equal "4.0", version
      contents << content
    end
    assert_equal 3, contents.count
    assert 'Card1\n', contents[0]
    assert 'Card2\n', contents[1]
    assert 'Card3\n', contents[2]
  end

  def test_content_multi_extra
    path = "test/data/content_multi_extra.vcf"
    t = VCardRegal::ContentTokenizer.new(path)
    contents = Array.new
    t.perform do |content, version|
      assert_equal "4.0", version
      contents << content
    end
    assert_equal 3, contents.count
    assert 'Card1\n', contents[0]
    assert 'Card2\n', contents[1]
    assert 'Card3\n', contents[2]
  end
end

