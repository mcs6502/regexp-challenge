# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      assert(RegexpM17N.non_empty?('.'.encode(enc)))
    end
  end

  def test_non_empty_string_using_all_code_converters_we_could_find
    Encoding.list.each do |enc|
      str = encode('.', enc)
      if str
        assert(RegexpM17N.non_empty?(str))
      else
        puts "No code converter for #{enc}"
      end
    end

    # Run through all encodings once again to verify that the non_empty? method works for multiple invocations.
    Encoding.list.each do |enc|
      str = encode('.', enc)
      if str
        assert(RegexpM17N.non_empty?(str))
        assert(RegexpM17N.non_empty?(str))
      end
    end
  end

  def encode(str, enc)
    begin
      str.encode(enc)
    rescue Encoding::ConverterNotFoundError => e
      nil
    end
  end
end
