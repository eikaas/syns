# syns
A quick and dirty CLI tool to find synonyms of a given word. Because _variable names can be hard, demanding, unmanageable, defiant, problematic, tricky, unruly and even vexed_.

## Credits
Synonyms are provided by the API at http://words.bighugelabs.com

## Install
1. Place the script whereever you would like
```bash
$ cd /usr/local/src
$ git clone https://github.com/eikaas/syns.git
$ ln -s /usr/local/bin/syns /usr/local/src/syns/syns.sh
```
2. Register at http://words.bighugelabs.com to get an API key
3. Put your API key in ~/.config/syns/apikey
```bash
mkdir -p ~/.config/syns
cat "herpderpimakey" > ~/.config/syns/apikey
```

## Syntax
```bash
./syns [--json] <...list of words>
	--json 	Output pretty json
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
