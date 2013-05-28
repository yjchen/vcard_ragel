require 'stringio'
require 'vcard_v3_line_tokenizer'
require 'minitest/autorun'

class TestVCardV3LineTokenizer < MiniTest::Test
  def setup
  end

  def test_v3_line_fn
    s = StringIO.new("FN:Apple Inc.\n")
    t = VCardRegal::V3LineTokenizer.new(s)
    t.perform do |content|
      assert_equal nil, content[:group]
      assert_equal 'fn', content[:name].downcase
      assert_equal nil, content[:param]
      assert_equal 'Apple Inc.', content[:value]
    end
  end

  def test_v3_line_n
    s = StringIO.new("N:Apple;Inc;;;\n")
    t = VCardRegal::V3LineTokenizer.new(s)
    t.perform do |content|
      assert_equal nil, content[:group]
      assert_equal 'n', content[:name].downcase
      assert_equal nil, content[:param]
      assert_equal 'Apple;Inc;;;', content[:value]
    end
  end

  def test_v3_line_email
    s = StringIO.new("EMAIL;type=INTERNET;type=WORK;type=pref:contact@apple.com\n")
    t = VCardRegal::V3LineTokenizer.new(s)
    t.perform do |content|
      assert_equal nil, content[:group]
      assert_equal 'email', content[:name].downcase
      assert_equal "type", content[:param].keys.first
      assert_equal 3, content[:param]["type"].count
      assert_includes content[:param]["type"], "pref"
      assert_includes content[:param]["type"], "WORK"
      assert_includes content[:param]["type"], "INTERNET"
      assert_equal 'contact@apple.com', content[:value]
    end
  end

  def test_v3_line_adr
    s = StringIO.new("item1.ADR;type=WORK;type=pref:;;1 Infinite Loop;Cupertino;CA;95014;United States\n")
    t = VCardRegal::V3LineTokenizer.new(s)
    t.perform do |content|
      assert_equal 'item1', content[:group]
      assert_equal 'adr', content[:name].downcase
      assert_equal "type", content[:param].keys.first
      assert_equal 2, content[:param]["type"].count
      assert_includes content[:param]["type"], "pref"
      assert_includes content[:param]["type"], "WORK"
      assert_equal ';;1 Infinite Loop;Cupertino;CA;95014;United States', content[:value]
    end
  end
end

