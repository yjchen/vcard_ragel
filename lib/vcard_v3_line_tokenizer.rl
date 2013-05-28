module VCardRegal

=begin
  %%{
    machine v3_line_tokenizer;

    include vcard_common    'vcard_common.rl';
    include vcard_v3_line   'vcard_v3_line.rl';

    action mark_group {
      my_ts = p
#      puts "mark_group #{p}: #{my_ts} #{my_te}"
    }

    action emit_group {
      my_te = p
#      puts "emit_group #{p}: #{my_ts} #{my_te}"
      ragel_emit_group data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    }

    action mark_name {
      my_ts = p
#      puts "mark_name #{p}: #{my_ts} #{my_te}"
    }

    action emit_name {
      my_te = p
#      puts "emit_name #{p}: #{my_ts} #{my_te}"
      ragel_emit_name data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    }

    action mark_param {
      my_ts = p
#      puts "mark_param #{p}: #{my_ts} #{my_te}"
    }

    action emit_param {
      my_te = p
#      puts "emit_param #{p}: #{my_ts} #{my_te}"
      ragel_emit_param data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    }

    action mark_value {
      my_ts = p
#      puts "mark_value #{p}: #{my_ts} #{my_te}"
    }

    action emit_value {
      my_te = p
#      puts "emit_value #{p}: #{my_ts} #{my_te}"
      ragel_emit_value data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    }

    action mark {
      my_ts = p
#      puts "mark #{p}: #{my_ts} #{my_te}"
    }

    action emit {
#      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
#      ragel_emit data[my_ts...my_te].pack('c*')
#      my_ts = nil
#      my_te = nil    
      ragel_emit nil do |content|
        yield content
      end
    }

    iana_token  = [0-9A-Za-z\-]*;
    x_name      = 'X-' [0-9A-Za-z\-]*;

    group       = iana_token >mark_group %emit_group;
    name        = iana_token >mark_name %emit_name;
    param_name  = iana_token;
    param_value = alnum*;
    param       = (param_name "=" param_value (',' param_value)*) >mark_param %emit_param;
#    param       = alnum >mark_param %emit_param;
    value       = any* >mark_value %emit_value;

    line        = (group '.')? name (';' param)* ':' value :>> CRLF_OR_LF >emit;

    main := line*;

  }%%
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

    %% write data;
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

    %% write init;
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
      %% write exec;
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
