module VCardRegal

=begin
  %%{
    machine simple_tokenizer;

    include vcard_common 'vcard_common.rl';

    action mark_version {
      my_ts = p
#      puts "mark #{p}: #{my_ts} #{my_te}"
    }

    action emit_version {
      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_version data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    }

    action mark {
      my_ts = p
      puts "mark #{p}: #{my_ts} #{my_te}"
    }

    action emit {
      my_te = p
      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_emit data[my_ts...my_te].pack('c*')
      my_ts = nil
      my_te = nil    
    }

    number      = digit+ ('.' digit+)?;

    prop_fn     = 'FN'i;
    prop_n      = 'N'i;
    
    group       = alnum | '-';
    name        = prop_fn | prop_n;
    param       = alnum;
    value       = any*;

    line        = (group '.')? name >mark (';' param)* ':' value :>> CRLF_OR_LF >emit;

    version     = 'VERSION:' number >mark_version %emit_version CRLF_OR_LF line*;

    vcard = VCARD_BEGIN version :>> VCARD_END;
    main := ( vcard | any+ )*;

  }%%
=end

class SimpleTokenizer
  attr_reader :path

  def initialize(path)
    if path.is_a?(String)
      @path = path
    elsif path.is_a?(StringIO) || path.is_a?(IO)
      @f = path
    end
    %% write data;
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
