
# line 1 "lib/vcard_content_tokenizer.rl"
module VCardRegal

# This tokenizer extract content of vcard.
# It return arrays of vcard content

=begin
  
# line 47 "lib/vcard_content_tokenizer.rl"

=end

class ContentTokenizer
  attr_accessor :version, :content
  attr_reader :path, :f

  def initialize(path)
    if path.is_a?(String)
      @path = path
    elsif path.is_a?(StringIO) || path.is_a?(IO)
      @f = path
    end
    
# line 26 "lib/vcard_content_tokenizer.rb"
class << self
	attr_accessor :_content_tokenizer_actions
	private :_content_tokenizer_actions, :_content_tokenizer_actions=
end
self._content_tokenizer_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3
]

class << self
	attr_accessor :_content_tokenizer_key_offsets
	private :_content_tokenizer_key_offsets, :_content_tokenizer_key_offsets=
end
self._content_tokenizer_key_offsets = [
	0, 1, 3, 5, 7, 9, 11, 13, 
	15, 17, 19, 21, 24, 26, 28, 30, 
	32, 34, 36, 38, 40, 43, 49, 50, 
	51, 53, 55, 58, 63
]

class << self
	attr_accessor :_content_tokenizer_trans_keys
	private :_content_tokenizer_trans_keys, :_content_tokenizer_trans_keys=
end
self._content_tokenizer_trans_keys = [
	66, 66, 69, 66, 71, 66, 73, 66, 
	78, 58, 66, 66, 86, 66, 67, 65, 
	66, 66, 82, 66, 68, 10, 13, 66, 
	66, 86, 66, 69, 66, 82, 66, 83, 
	66, 73, 66, 79, 66, 78, 58, 66, 
	66, 48, 57, 10, 13, 46, 66, 48, 
	57, 10, 10, 66, 69, 10, 66, 66, 
	48, 57, 10, 13, 66, 48, 57, 10, 
	66, 0
]

class << self
	attr_accessor :_content_tokenizer_single_lengths
	private :_content_tokenizer_single_lengths, :_content_tokenizer_single_lengths=
end
self._content_tokenizer_single_lengths = [
	1, 2, 2, 2, 2, 2, 2, 2, 
	2, 2, 2, 3, 2, 2, 2, 2, 
	2, 2, 2, 2, 1, 4, 1, 1, 
	2, 2, 1, 3, 2
]

class << self
	attr_accessor :_content_tokenizer_range_lengths
	private :_content_tokenizer_range_lengths, :_content_tokenizer_range_lengths=
end
self._content_tokenizer_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 1, 0, 0, 
	0, 0, 1, 1, 0
]

class << self
	attr_accessor :_content_tokenizer_index_offsets
	private :_content_tokenizer_index_offsets, :_content_tokenizer_index_offsets=
end
self._content_tokenizer_index_offsets = [
	0, 2, 5, 8, 11, 14, 17, 20, 
	23, 26, 29, 32, 36, 39, 42, 45, 
	48, 51, 54, 57, 60, 63, 69, 71, 
	73, 76, 79, 82, 87
]

class << self
	attr_accessor :_content_tokenizer_indicies
	private :_content_tokenizer_indicies, :_content_tokenizer_indicies=
end
self._content_tokenizer_indicies = [
	1, 0, 1, 2, 0, 1, 3, 0, 
	1, 4, 0, 1, 5, 0, 6, 1, 
	0, 1, 7, 0, 1, 8, 0, 9, 
	1, 0, 1, 10, 0, 1, 11, 0, 
	12, 13, 1, 0, 1, 14, 0, 1, 
	15, 0, 1, 16, 0, 1, 17, 0, 
	1, 18, 0, 1, 19, 0, 1, 20, 
	0, 21, 1, 0, 1, 22, 0, 23, 
	24, 25, 1, 26, 0, 28, 27, 30, 
	29, 1, 31, 0, 32, 1, 0, 1, 
	33, 0, 23, 24, 1, 33, 0, 12, 
	1, 0, 0
]

class << self
	attr_accessor :_content_tokenizer_trans_targs
	private :_content_tokenizer_trans_targs, :_content_tokenizer_trans_targs=
end
self._content_tokenizer_trans_targs = [
	0, 1, 2, 3, 4, 5, 6, 7, 
	8, 9, 10, 11, 12, 28, 13, 14, 
	15, 16, 17, 18, 19, 20, 21, 22, 
	25, 26, 21, 23, 24, 23, 24, 0, 
	22, 27
]

class << self
	attr_accessor :_content_tokenizer_trans_actions
	private :_content_tokenizer_trans_actions, :_content_tokenizer_trans_actions=
end
self._content_tokenizer_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 1, 3, 
	3, 0, 0, 5, 5, 0, 0, 7, 
	0, 0
]

class << self
	attr_accessor :content_tokenizer_start
end
self.content_tokenizer_start = 0;
class << self
	attr_accessor :content_tokenizer_first_final
end
self.content_tokenizer_first_final = 0;
class << self
	attr_accessor :content_tokenizer_error
end
self.content_tokenizer_error = -1;

class << self
	attr_accessor :content_tokenizer_en_main
end
self.content_tokenizer_en_main = 0;


# line 61 "lib/vcard_content_tokenizer.rl"
    # % (this fixes syntax highlighting)
  end

  def ragel_version(s)
    @version = s
  end

  def ragel_emit(s)
    @content = s
    if block_given?
      yield @content, @version
    end
    @version = nil
    @content = nil
  end

  def perform
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    
# line 181 "lib/vcard_content_tokenizer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = content_tokenizer_start
end

# line 83 "lib/vcard_content_tokenizer.rl"
    # % (this fixes syntax highlighting)

    leftover = []
    my_ts = nil
    my_te = nil
                                                              
    if @path
      io = File.open(path)
    elsif @f
      io = @f 
      io.open if io.closed?
    end

    while chunk = io.read((ENV['CHUNK_SIZE'] || 2048).to_i)
      data = leftover + chunk.unpack('c*')
      p = 0
      pe = data.length
      
# line 207 "lib/vcard_content_tokenizer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	end
	if _goto_level <= _resume
	_keys = _content_tokenizer_key_offsets[cs]
	_trans = _content_tokenizer_index_offsets[cs]
	_klen = _content_tokenizer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _content_tokenizer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _content_tokenizer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _content_tokenizer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _content_tokenizer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _content_tokenizer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _content_tokenizer_indicies[_trans]
	cs = _content_tokenizer_trans_targs[_trans]
	if _content_tokenizer_trans_actions[_trans] != 0
		_acts = _content_tokenizer_trans_actions[_trans]
		_nacts = _content_tokenizer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _content_tokenizer_actions[_acts - 1]
when 0 then
# line 12 "lib/vcard_content_tokenizer.rl"
		begin

      my_ts = p
#      puts "mark #{p}: #{my_ts} #{my_te}"
    		end
when 1 then
# line 17 "lib/vcard_content_tokenizer.rl"
		begin

      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_version data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
when 2 then
# line 25 "lib/vcard_content_tokenizer.rl"
		begin

      my_ts = p
#      puts "mark #{p}: #{my_ts} #{my_te}"
    		end
when 3 then
# line 30 "lib/vcard_content_tokenizer.rl"
		begin

      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_emit data[my_ts...my_te].pack('c*') do |content, version|
        if block_given?
          yield content, version
        end
      end
      my_ts = nil
      my_te = nil    
    		end
# line 322 "lib/vcard_content_tokenizer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 101 "lib/vcard_content_tokenizer.rl"
      # % (this fixes syntax highlighting)
      if my_ts
        leftover = data[my_ts..-1]
        my_te = my_te - my_ts if my_te
        my_ts = 0
      else
        leftover = []
      end
    end

    io.close

  end
end

end
