<projects>{
for $project in doc("projects.xml")//project
where every $person in $project//person satisfies (doc("persons.xml")//person[@document = $person/@document]/age > 31)
return $project
}</projects>
