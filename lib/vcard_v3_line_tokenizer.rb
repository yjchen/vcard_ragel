
# line 1 "lib/vcard_v3_line_tokenizer.rl"
module VCardRegal

=begin
  
# line 93 "lib/vcard_v3_line_tokenizer.rl"

=end

class V3LineTokenizer
  attr_accessor :content_line, :group, :name, :param, :value
  attr_reader :path

  def initialize(path)
    if path.is_a?(String)
      @path = path
    elsif path.is_a?(StringIO) || path.is_a?(IO)
      @f = path
    end
    content_line = Array.new

    
# line 25 "lib/vcard_v3_line_tokenizer.rb"
class << self
	attr_accessor :_v3_line_tokenizer_actions
	private :_v3_line_tokenizer_actions, :_v3_line_tokenizer_actions=
end
self._v3_line_tokenizer_actions = [
	0, 1, 1, 1, 2, 1, 3, 1, 
	4, 1, 5, 1, 6, 2, 0, 1, 
	2, 0, 2, 2, 2, 3, 2, 7, 
	8, 3, 6, 7, 8
]

class << self
	attr_accessor :_v3_line_tokenizer_key_offsets
	private :_v3_line_tokenizer_key_offsets, :_v3_line_tokenizer_key_offsets=
end
self._v3_line_tokenizer_key_offsets = [
	0, 0, 10, 19, 28, 30, 32, 40, 
	48, 57
]

class << self
	attr_accessor :_v3_line_tokenizer_trans_keys
	private :_v3_line_tokenizer_trans_keys, :_v3_line_tokenizer_trans_keys=
end
self._v3_line_tokenizer_trans_keys = [
	45, 46, 58, 59, 48, 57, 65, 90, 
	97, 122, 45, 58, 59, 48, 57, 65, 
	90, 97, 122, 45, 58, 59, 48, 57, 
	65, 90, 97, 122, 10, 13, 10, 13, 
	45, 61, 48, 57, 65, 90, 97, 122, 
	45, 61, 48, 57, 65, 90, 97, 122, 
	44, 58, 59, 48, 57, 65, 90, 97, 
	122, 45, 46, 58, 59, 48, 57, 65, 
	90, 97, 122, 0
]

class << self
	attr_accessor :_v3_line_tokenizer_single_lengths
	private :_v3_line_tokenizer_single_lengths, :_v3_line_tokenizer_single_lengths=
end
self._v3_line_tokenizer_single_lengths = [
	0, 4, 3, 3, 2, 2, 2, 2, 
	3, 4
]

class << self
	attr_accessor :_v3_line_tokenizer_range_lengths
	private :_v3_line_tokenizer_range_lengths, :_v3_line_tokenizer_range_lengths=
end
self._v3_line_tokenizer_range_lengths = [
	0, 3, 3, 3, 0, 0, 3, 3, 
	3, 3
]

class << self
	attr_accessor :_v3_line_tokenizer_index_offsets
	private :_v3_line_tokenizer_index_offsets, :_v3_line_tokenizer_index_offsets=
end
self._v3_line_tokenizer_index_offsets = [
	0, 0, 8, 15, 22, 25, 28, 34, 
	40, 47
]

class << self
	attr_accessor :_v3_line_tokenizer_indicies
	private :_v3_line_tokenizer_indicies, :_v3_line_tokenizer_indicies=
end
self._v3_line_tokenizer_indicies = [
	0, 2, 3, 4, 0, 0, 0, 1, 
	5, 6, 7, 5, 5, 5, 1, 8, 
	3, 4, 8, 8, 8, 1, 10, 11, 
	9, 13, 14, 12, 15, 16, 15, 15, 
	15, 1, 17, 18, 17, 17, 17, 1, 
	18, 19, 20, 18, 18, 18, 1, 21, 
	22, 6, 7, 21, 21, 21, 1, 0
]

class << self
	attr_accessor :_v3_line_tokenizer_trans_targs
	private :_v3_line_tokenizer_trans_targs, :_v3_line_tokenizer_trans_targs=
end
self._v3_line_tokenizer_trans_targs = [
	1, 0, 2, 4, 6, 3, 4, 6, 
	3, 5, 9, 5, 5, 9, 5, 7, 
	8, 7, 8, 4, 6, 1, 2
]

class << self
	attr_accessor :_v3_line_tokenizer_trans_actions
	private :_v3_line_tokenizer_trans_actions, :_v3_line_tokenizer_trans_actions=
end
self._v3_line_tokenizer_trans_actions = [
	0, 0, 1, 5, 5, 3, 19, 19, 
	0, 11, 25, 25, 0, 22, 22, 7, 
	7, 0, 0, 9, 9, 16, 13
]

class << self
	attr_accessor :v3_line_tokenizer_start
end
self.v3_line_tokenizer_start = 9;
class << self
	attr_accessor :v3_line_tokenizer_first_final
end
self.v3_line_tokenizer_first_final = 9;
class << self
	attr_accessor :v3_line_tokenizer_error
end
self.v3_line_tokenizer_error = 0;

class << self
	attr_accessor :v3_line_tokenizer_en_main
end
self.v3_line_tokenizer_en_main = 9;


# line 109 "lib/vcard_v3_line_tokenizer.rl"
    # % (this fixes syntax highlighting)
  end

  def ragel_emit_group(s)
#    $stdout.puts s
    @group = s
  end

  def ragel_emit_name(s)
#    $stdout.puts s
    @name = s
  end

  def ragel_emit_param(s)
    @param ||= Hash.new
    p = s.split('=')
    return if p.count != 2
    key = p[0].downcase
    if @param[key]
      if @param[key].is_a?(Array)
        @param[key] << p[1]
      else
        @param[key] = [@param[key], p[1]]
      end
    else
      @param[key] = p[1]
    end
#    $stdout.puts s
  end

  def ragel_emit_value(s)
    @value = s
#    $stdout.puts s
  end

  def ragel_emit(s)
    # End of line
    @content = {
      group: @group,
      name: @name,
      param: @param,
      value: @value
    }
    yield @content
#    $stdout.puts s
  end

  def perform
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    
# line 196 "lib/vcard_v3_line_tokenizer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = v3_line_tokenizer_start
end

# line 162 "lib/vcard_v3_line_tokenizer.rl"
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
      
# line 222 "lib/vcard_v3_line_tokenizer.rb"
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
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _v3_line_tokenizer_key_offsets[cs]
	_trans = _v3_line_tokenizer_index_offsets[cs]
	_klen = _v3_line_tokenizer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _v3_line_tokenizer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _v3_line_tokenizer_trans_keys[_mid]
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
	  _klen = _v3_line_tokenizer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _v3_line_tokenizer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _v3_line_tokenizer_trans_keys[_mid+1]
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
	_trans = _v3_line_tokenizer_indicies[_trans]
	cs = _v3_line_tokenizer_trans_targs[_trans]
	if _v3_line_tokenizer_trans_actions[_trans] != 0
		_acts = _v3_line_tokenizer_trans_actions[_trans]
		_nacts = _v3_line_tokenizer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _v3_line_tokenizer_actions[_acts - 1]
when 0 then
# line 10 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_ts = p
#      puts "mark_group #{p}: #{my_ts} #{my_te}"
    		end
when 1 then
# line 15 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_te = p
#      puts "emit_group #{p}: #{my_ts} #{my_te}"
      ragel_emit_group data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
when 2 then
# line 23 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_ts = p
#      puts "mark_name #{p}: #{my_ts} #{my_te}"
    		end
when 3 then
# line 28 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_te = p
#      puts "emit_name #{p}: #{my_ts} #{my_te}"
      ragel_emit_name data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
when 4 then
# line 36 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_ts = p
#      puts "mark_param #{p}: #{my_ts} #{my_te}"
    		end
when 5 then
# line 41 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_te = p
#      puts "emit_param #{p}: #{my_ts} #{my_te}"
      ragel_emit_param data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
when 6 then
# line 49 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_ts = p
#      puts "mark_value #{p}: #{my_ts} #{my_te}"
    		end
when 7 then
# line 54 "lib/vcard_v3_line_tokenizer.rl"
		begin

      my_te = p
#      puts "emit_value #{p}: #{my_ts} #{my_te}"
      ragel_emit_value data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    		end
when 8 then
# line 67 "lib/vcard_v3_line_tokenizer.rl"
		begin

#      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
#      ragel_emit data[my_ts...my_te].pack('c*')
#      my_ts = nil
#      my_te = nil    
      ragel_emit nil do |content|
        yield content
      end
    		end
# line 384 "lib/vcard_v3_line_tokenizer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
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

# line 180 "lib/vcard_v3_line_tokenizer.rl"
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
