%%{
  machine vcard_common;

  HTAB        = 0x9; # 9
  CR          = 0xD; # 13
  LF          = 0xA; # 10
  SPACE       = 0x20; # 32
  DQUOTE      = 0x22; # 34
  COMMA       = 44;
  SEMICOLON   = 59;
  BACKSLASH   = 92;

  VCHAR       = 0x21 .. 0x7E;

  CRLF        = CR LF;
  CRLF_OR_LF  = CRLF | LF;
  WSP         = SPACE | HTAB;

  unsigned_number   = digit+ ('.' digit+)?;

  VCARD_BEGIN = 'BEGIN:VCARD' CRLF_OR_LF;
  VCARD_END   = 'END:VCARD';
}%%
