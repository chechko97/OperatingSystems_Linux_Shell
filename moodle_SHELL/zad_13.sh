#!/bin/bash
filename=$1
echo "<html>
<table>
  <tr>
    <th>FN</th>
    <th>Firstname</th>
    <th>Lastname</th>
    <th>Specialty</th>
    <th>Course</th>
    <th>Group</th>
  </tr>" > $filename
cat ~/passwd | egrep "^s[[:digit:]]{5}:x:....:...:[A-Z][a-z]+[[:space:]][A-Z][a-z]+, SI," > temp
while read line; do
   fn=$(echo $line | cut -d ':' -f1 | cut -c 2-)
   first=$(echo $line | cut -d ':' -f5 | cut -d ' ' -f1)
   last=$(echo $line | cut -d ':' -f5 | cut -d ' ' -f2 | cut -d ',' -f1)
   speciality=$(echo $line | cut -d ',' -f2 | cut -d ' ' -f2)
   course=$(echo $line | cut -d ',' -f3 | cut -d ' ' -f2)
   group=$(echo $line | cut -d ',' -f4 | cut -d ' ' -f2 | cut -d ':' -f1)
   array=($fn $first $last $speciality $course $group)
   echo "<tr>" >> $filename
   for element in "${array[@]}"; do
      echo "<th>$element</th>" >> $filename
   done
   echo "</tr>" >> $filename
done < temp
echo "</table>
</html>" >> $filename
rm temp
