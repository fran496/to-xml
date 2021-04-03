# function format_field(i) {
#   # For formatting every field of the CSV depending on the user's need
#   switch (i) {
#     case field_number:
#       $field_number = transformation or replacement for field;
#       break;
#   }
# }

# ROT: ROot element Tag
# RET: REcord element Tag
BEGIN {FS = ",";OFS = "\n";ROT="Root";RET = "Record"}

NR == 1 {
  # Store the name of each column as tags for the xml document
  for (i = 1; i <= NF; i++) {
    field_tags[i]=$i;
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
    print "     <" field_tags[i] ">" $i "</" field_tags[i] ">";
  }
  print "  </" RET ">"
}

END {print "</" ROT ">"}
