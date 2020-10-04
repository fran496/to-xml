awk -f to-xml.awk test/input.csv > test/output.xml
test_result=$(cmp -s test/output.xml test/expected-output.xml)

if $test_result; then
  echo "TEST PASSED: Result of the program matches expected output."
else
  echo "TEST FAILED: Output doesn't match expected output."
  vim -d test/output.xml test/expected-output.xml
  if [ $? -eq 0 ]; then
    echo "Openning vim difftool."
  else
    echo "Vim not installed.\nExiting."
  fi
fi
echo "Removing test output file."
rm test/output.xml
echo "END OF TEST."
