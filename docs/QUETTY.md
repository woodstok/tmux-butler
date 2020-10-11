quetty
-----------
quetty is a script that filters/tokenizes the standard input based on the options provided. 
The filters can be predefined, regular expressions specified using the `-regex` flag, or a custom flag specified using `-custom`. Multiple filters can be provided and the final list of tokens will be an OR of all the filters.

#### Predefined 
- hash - hash values 
- ip - ip addresses and ip prefixes
- nospace - strings that match \S+
- num - numbers
- word - strings that match \w+
- path - filesystem path like strings
- quote - entire single and double quoted strings

eg: To filter out ip addressess and paths from standard input
```
scripts/quetty -path -ip
```


#### Custom regular expressions
In addition to these, user can provide custom filters by using the `-regex` flag.
eg: To filter only words that start with the character 'a', 
```
scripts/quetty -regex 'a\w*'
```

#### Custom filters
In addition to specifying custom regexes using the `-regex` flag, you can write more detailed filters using bash scripts in the `filters/` directory. The name of the filter can be anything BUT the predefined filters mentioned above. 

For each filter specified, quetty passes the input through the filter script and saves the output to be later sorted and uniqued.

`-path` is a custom filter. Take a look at the `fitlers/path` script for a simple custom filter implementation.


A simpler example: To filter only words that start with the character 'b', create a file `filters/bword` with the following contents.
```
#!/usr/bin/env bash
# the -o will make sure that only the matched tokens are printed out and not the entire line
egrep -o 'b\w+'
```
Make sure it is executable
```
chmod +x filters/bword
```
To use this filter
```
scripts/quetty -bword
```
