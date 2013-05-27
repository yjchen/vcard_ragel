
# line 1 "lib/vcard_ragel.rl"
module VCardRegal

=begin
  
# line 52 "lib/vcard_ragel.rl"

=end

class SimpleTokenizer
  attr_reader :path

  def initialize(path)
    if path.is_a?(String)
      @path = path
    elsif path.is_a?(StringIO) || path.is_a?(IO)
      @f = path
    end
    
# line 22 "lib/vcard_ragel.rb"
class << self
	attr_accessor :_simple_tokenizer_actions
	private :_simple_tokenizer_actions, :_simple_tokenizer_actions=
end
self._simple_tokenizer_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3
]

class << self
	attr_accessor :_simple_tokenizer_key_offsets
	private :_simple_tokenizer_key_offsets, :_simple_tokenizer_key_offsets=
end
self._simple_tokenizer_key_offsets = [
	0, 1, 3, 5, 7, 9, 11, 13, 
	15, 17, 19, 21, 24, 26, 28, 30, 
	32, 34, 36, 38, 40, 43, 49, 61, 
	63, 68, 71, 74, 77, 81, 85, 89, 
	93, 97, 101, 105, 109, 113, 117, 120, 
	133, 136, 140, 144, 151, 155, 158, 161, 
	163, 166, 171
]

class << self
	attr_accessor :_simple_tokenizer_trans_keys
	private :_simple_tokenizer_trans_keys, :_simple_tokenizer_trans_keys=
end
self._simple_tokenizer_trans_keys = [
	66, 66, 69, 66, 71, 66, 73, 66, 
	78, 58, 66, 66, 86, 66, 67, 65, 
	66, 66, 82, 66, 68, 10, 13, 66, 
	66, 86, 66, 69, 66, 82, 66, 83, 
	66, 73, 66, 79, 66, 78, 58, 66, 
	66, 48, 57, 10, 13, 46, 66, 48, 
	57, 45, 66, 70, 78, 102, 110, 48, 
	57, 65, 90, 97, 122, 46, 66, 66, 
	70, 78, 102, 110, 66, 78, 110, 58, 
	59, 66, 10, 13, 66, 10, 13, 66, 
	69, 10, 13, 66, 71, 10, 13, 66, 
	73, 10, 13, 66, 78, 10, 13, 58, 
	66, 10, 13, 66, 86, 10, 13, 66, 
	67, 10, 13, 65, 66, 10, 13, 66, 
	82, 10, 13, 66, 68, 10, 13, 66, 
	45, 66, 70, 78, 86, 102, 110, 48, 
	57, 65, 90, 97, 122, 46, 66, 69, 
	46, 66, 78, 110, 46, 58, 59, 66, 
	66, 48, 57, 65, 90, 97, 122, 58, 
	59, 66, 69, 46, 66, 69, 10, 13, 
	66, 10, 66, 66, 48, 57, 10, 13, 
	66, 48, 57, 10, 66, 0
]

class << self
	attr_accessor :_simple_tokenizer_single_lengths
	private :_simple_tokenizer_single_lengths, :_simple_tokenizer_single_lengths=
end
self._simple_tokenizer_single_lengths = [
	1, 2, 2, 2, 2, 2, 2, 2, 
	2, 2, 2, 3, 2, 2, 2, 2, 
	2, 2, 2, 2, 1, 4, 6, 2, 
	5, 3, 3, 3, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 3, 7, 
	3, 4, 4, 1, 4, 3, 3, 2, 
	1, 3, 2
]

class << self
	attr_accessor :_simple_tokenizer_range_lengths
	private :_simple_tokenizer_range_lengths, :_simple_tokenizer_range_lengths=
end
self._simple_tokenizer_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 1, 1, 3, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 3, 
	0, 0, 0, 3, 0, 0, 0, 0, 
	1, 1, 0
]

class << self
	attr_accessor :_simple_tokenizer_index_offsets
	private :_simple_tokenizer_index_offsets, :_simple_tokenizer_index_offsets=
end
self._simple_tokenizer_index_offsets = [
	0, 2, 5, 8, 11, 14, 17, 20, 
	23, 26, 29, 32, 36, 39, 42, 45, 
	48, 51, 54, 57, 60, 63, 69, 79, 
	82, 88, 92, 96, 100, 105, 110, 115, 
	120, 125, 130, 135, 140, 145, 150, 154, 
	165, 169, 174, 179, 184, 189, 193, 197, 
	200, 203, 208
]

class << self
	attr_accessor :_simple_tokenizer_indicies
	private :_simple_tokenizer_indicies, :_simple_tokenizer_indicies=
end
self._simple_tokenizer_indicies = [
	1, 0, 1, 2, 0, 1, 3, 0, 
	1, 4, 0, 1, 5, 0, 6, 1, 
	0, 1, 7, 0, 1, 8, 0, 9, 
	1, 0, 1, 10, 0, 1, 11, 0, 
	12, 13, 1, 0, 1, 14, 0, 1, 
	15, 0, 1, 16, 0, 1, 17, 0, 
	1, 18, 0, 1, 19, 0, 1, 20, 
	0, 21, 1, 0, 1, 22, 0, 23, 
	24, 25, 1, 26, 0, 27, 28, 29, 
	30, 29, 30, 27, 27, 27, 0, 31, 
	1, 0, 1, 32, 33, 32, 33, 0, 
	1, 34, 34, 0, 35, 36, 1, 0, 
	37, 38, 39, 35, 37, 38, 39, 40, 
	35, 37, 38, 39, 41, 35, 37, 38, 
	39, 42, 35, 37, 38, 39, 43, 35, 
	37, 38, 44, 39, 35, 37, 38, 39, 
	45, 35, 37, 38, 39, 46, 35, 37, 
	38, 47, 39, 35, 37, 38, 39, 48, 
	35, 37, 38, 39, 49, 35, 50, 51, 
	39, 35, 27, 28, 29, 30, 52, 29, 
	30, 27, 27, 27, 0, 31, 1, 2, 
	0, 31, 1, 34, 34, 0, 31, 35, 
	36, 1, 0, 53, 34, 34, 34, 0, 
	35, 36, 1, 2, 0, 31, 1, 15, 
	0, 50, 38, 39, 35, 54, 1, 0, 
	1, 55, 0, 23, 24, 1, 55, 0, 
	12, 1, 0, 0
]

class << self
	attr_accessor :_simple_tokenizer_trans_targs
	private :_simple_tokenizer_trans_targs, :_simple_tokenizer_trans_targs=
end
self._simple_tokenizer_trans_targs = [
	0, 1, 2, 3, 4, 5, 6, 7, 
	8, 9, 10, 11, 12, 50, 13, 14, 
	15, 16, 17, 18, 19, 20, 21, 22, 
	47, 48, 21, 23, 40, 41, 42, 24, 
	25, 26, 26, 27, 43, 22, 27, 28, 
	29, 30, 31, 32, 33, 34, 35, 36, 
	37, 38, 39, 46, 45, 44, 22, 49
]

class << self
	attr_accessor :_simple_tokenizer_trans_actions
	private :_simple_tokenizer_trans_actions, :_simple_tokenizer_trans_actions=
end
self._simple_tokenizer_trans_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 1, 3, 
	3, 0, 0, 0, 0, 5, 5, 0, 
	5, 5, 0, 0, 0, 7, 7, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 7, 7, 0, 0, 0, 0
]

class << self
	attr_accessor :simple_tokenizer_start
end
self.simple_tokenizer_start = 0;
class << self
	attr_accessor :simple_tokenizer_first_final
end
self.simple_tokenizer_first_final = 0;
class << self
	attr_accessor :simple_tokenizer_error
end
self.simple_tokenizer_error = -1;

class << self
	attr_accessor :simple_tokenizer_en_main
end
self.simple_tokenizer_en_main = 0;


# line 65 "lib/vcard_ragel.rl"
    # % (this fixes syntax highlighting)
  end

  def ragel_version(s)
    $stdout.puts s
  end

  def ragel_emit(s)
    $stdout.puts s
  end

  def perform
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    
# line 216 "lib/vcard_ragel.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = simple_tokenizer_start
end

# line 82 "lib/vcard_ragel.rl"
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
      
# line 242 "lib/vcard_ragel.rb"
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
	_keys = _simple_tokenizer_key_offsets[cs]
	_trans = _simple_tokenizer_index_offsets[cs]
	_klen = _simple_tokenizer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _simple_tokenizer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _simple_tokenizer_trans_keys[_mid]
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
	  _klen = _simple_tokenizer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _simple_tokenizer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _simple_tokenizer_trans_keys[_mid+1]
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
	_trans = _simple_tokenizer_indicies[_trans]
	cs = _simple_tokenizer_trans_targs[_trans]
	if _simple_tokenizer_trans_actions[_trans] != 0
		_acts = _simple_tokenizer_trans_actions[_trans]
		_nacts = _simple_tokenizer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _simple_tokenizer_actions[_acts - 1]
when 0 then
# line 9 "lib/vcard_ragel.rl"
		begin

      my_ts = p
#      puts "mark #{p}: #{my_ts} #{my_te}"
    		end
when 1 then
# line 14 "lib/vcard_ragel.rl"
		begin

      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_version data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
when 2 then
# line 22 "lib/vcard_ragel.rl"
		begin

      my_ts = p
      puts "mark #{p}: #{my_ts} #{my_te}"
    		end
when 3 then
# line 27 "lib/vcard_ragel.rl"
		begin

      my_te = p
      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_emit data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
# line 353 "lib/vcard_ragel.rb"
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

# line 100 "lib/vcard_ragel.rl"
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
