# function format_field(i) {
#   # For formatting every field of the CSV depending on the user's need
#   switch (i) {
#     case field_number:
#       $field_number = transformation or replacement for field;
#       break;
#   }
# }

function is_in_array(value, arr) {
  for (i in arr) {
    if (arr[i] == value) {
      return 1
    }
  }
}

BEGIN {FS = ",";OFS = "\n";ROT = "Root";RET = "Record";EFS = 0} 

if (EFS != 0) {
  split(EFS, unwanted_fields, ",")
}

NR == 1 {
  # Store the name of each column as tags for the xml document
  for (i = 1; i <= NF; i++) {
    if (!is_in_array(i, unwanted_fields)) {
	 print i;
         field_tags[i]=$i;
    }
  }

  # XML prolog
  print "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>";
  # XML root element with schema
  print "<" ROT " xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">";
}

NR > 1 {
  # Each value of each row will be surrounded by its respective column's name.
  print "  <" RET ">"

  for (i = 1; i <= NF; i++) {
    # format_field(i);
    if (!is_in_array(i, unwanted_fields)) {
      print "     <" field_tags[i] ">" $i "</" field_tags[i] ">";
    }
  }
  print "  </" RET ">"
}

END {print "</" ROT ">"}
