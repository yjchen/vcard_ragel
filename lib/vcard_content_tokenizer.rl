module VCardRegal

# This tokenizer extract content of vcard.
# It return arrays of vcard content

=begin
  %%{
    machine content_tokenizer;

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
#      puts "mark #{p}: #{my_ts} #{my_te}"
    }

    action emit {
      my_te = p
#      puts "emit #{p}: #{my_ts} #{my_te}"
      ragel_emit data[my_ts...my_te].pack('c*') do |content, version|
        if block_given?
          yield content, version
        end
      end
      my_ts = nil
      my_te = nil    
    }

    version = 'VERSION:' unsigned_number >mark_version %emit_version CRLF_OR_LF;

    vcard = VCARD_BEGIN version any* >mark :>> CRLF_OR_LF %emit VCARD_END;
    main := ( vcard | any+ )*;

  }%%
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
    @folding = true
    %% write data;
    # % (this fixes syntax highlighting)
  end

  def ragel_version(s)
    @version = s
  end

  def ragel_emit(s)
    @content = s

    if @folding
      @content = @content.gsub(/(\n|\r\n)[ \t]/, '')
    end

    if block_given?
      yield @content, @version
    end
    @version = nil
    @content = nil
  end

  def perform(folding: true)
    # So that ragel doesn't try to get it from data.length
    pe = :ignored
    eof = :ignored

    @folding = folding

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
