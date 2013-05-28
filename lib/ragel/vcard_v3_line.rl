%%{
  machine vcard_v3_line;

  NON_ASCII   = 0x80 .. 0xFF;
  QSAFE_CHAR  = WSP | 0x21 | 0x23 .. 0x7E | NON_ASCII;
  SAFE_CHAR   = WSP | 0x21 | 0x23 .. 0x2B | 0x2D .. 0x39 | 0x3C .. 0x7E | NON_ASCII;
  VALUE_CHAR  = WSP | VCHAR | NON_ASCII;

}%%
