<projects>{
for $p in doc('projects.xml')//project
where count($p//person) >= 2 and count($p//person) <= 8
return $p
}
</projects>
