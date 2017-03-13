# syns
A quick and dirty CLI tool to find synonyms of a given word. Because ""variable naming"" can be hard.

## Credits
Synonyms are provided by the API at http://words.bighugelabs.com

## Install
1. Place the script whereever you would like
2. Register at http://words.bighugelabs.com to get an API key
3. Put your API key in ~/.config/syns/apikey

## Usage
```bash
./syns [...list of words] [--json]
```


### Normal CLI usage
```bash
% ./syns.sh variable
variable (adjective)
           varying
           invariable
           inconsistent
           inconstant
           adaptable
           changeable
           covariant
           multivariate
           protean
           shifting
           uncertain
           unsettled
           variant
           varied
           versatile
variable (noun)
           variable quantity
           variable star
           quantity
           star
           symbol
           thing
```

### Request output in pretty JSON
```json
% ./syns.sh variable --json
{
    "adjective": {
        "ant": [
            "invariable"
        ],
        "rel": [
            "inconsistent",
            "inconstant"
        ],
        "sim": [
            "adaptable",
            "changeable",
            "covariant",
            "multivariate",
            "protean",
            "shifting",
            "uncertain",
            "unsettled",
            "variant",
            "varied",
            "versatile"
        ],
        "syn": [
            "varying"
        ]
    },
    "noun": {
        "syn": [
            "variable quantity",
            "variable star",
            "quantity",
            "star",
            "symbol",
            "thing"
        ]
    }
}
