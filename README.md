# to-xml
Program to convert any csv file into xml format.

By default the field separator (FS) is set to comma (,).

The input files for testing where generated with [convertcsv](https://www.convertcsv.com/generate-test-data.htm) and the tests were run on Gnu Awk 5.0.0.

## Parameters
ROT (Root element tag): name of the root element for the XML output. By default is "Root".
RET (Record element tag): name of the XML element that wraps every record of the CSV file on the XML output.
By default is "Record".

You can set a parameter with the "v" flag, i.e: awk -f to-xml.awk -v RET='Main' file.csv > output.xml.

The base of this Awk program was created by a moderator of the Unix and Linux
Forums called [vgersh99](https://www.unix.com/member_modal.php?u=37898) and it
was found at [post](https://www.unix.com/shell-programming-and-scripting/21404-csv-xml.html).


# TODO

- [x] Allow the user to set the file separator for the csv file
- [x] Allow the user to set the name of the tag that wraps every register
- [x] Allow the user to customize fields (user must adapt the **format\_field**
  function located at the top of the to-xml.awk script)
- [ ] Allow the user to remove unwanted fields from output
- [ ] Implement binary search to support the removal of unwanted fields for larger files
