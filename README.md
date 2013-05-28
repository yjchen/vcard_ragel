## VCard Ragel

VCard Ragel provides tokenizers to parse vCard (RFC 6350).

## Data Format

It try to parse a vCard into this Ruby hash:

```
[{
   group: property_group,
   name:  property_name,
   param: {
            param_name: param_value, # or [param_value1, param_value2]
            param_name1: ...
          }
   value: property_value
 },
 { ... }
]
```
   
### VCardRagel::ContentTokenizer

Extract contents of VCard.

### VCardRagel::LineTokenizer

Parse each line of VCard specification.

### VCardRagel::VCardTokenizer

Full tokenizer of VCard.
