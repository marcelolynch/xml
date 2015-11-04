for $persona in doc("persons.xml")//person
 return
 <person>
 <category>{
 if ($persona[age > 18])
 then if ($persona[age > 65])
 then "Retired"
 else "Working age"
 else "Under age"
}</category>
 </person> 
