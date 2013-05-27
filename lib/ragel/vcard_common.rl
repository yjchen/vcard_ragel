%%{
  machine vcard_common;

  CR          = 13;
  LF          = 10;
  CRLF        = CR LF;
  CRLF_OR_LF  = CRLF | LF;
  COMMA       = 44;

  unsigned_number   = digit+ ('.' digit+)?;

  VCARD_BEGIN = 'BEGIN:VCARD' CRLF_OR_LF;
  VCARD_END   = 'END:VCARD';
}%%
