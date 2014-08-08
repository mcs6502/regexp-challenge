module RegexpM17N
  def self.non_empty?(str)
    enc = str.encoding
    if enc.dummy? # cannot create regexps for dummy encodings, so encode the string instead
      static_regexp = /^.+$/
      static_regexp =~ str.encode(static_regexp.encoding)
    else # otherwise create use an encoding-specific method that will use its own regexp
      unless enc.respond_to?(:non_empty_str?)
        regexp = Regexp.new('^.+$'.encode(enc))
        enc.instance_eval do
          define_singleton_method(:non_empty_str?) do |str|
            regexp =~ str
          end
        end
      end
      enc.non_empty_str?(str)
    end
  end
end