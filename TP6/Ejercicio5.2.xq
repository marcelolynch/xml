<projects>{
for $project in doc("projects.xml")//project
let $documents := $project//person/@document
let $ages := doc("persons.xml")//person[@document = $documents]/age
where some $age in $ages satisfies ($age > 49)
return $project
}
</projects>
