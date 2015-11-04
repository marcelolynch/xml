<projects>{
    let $numPeople := count(doc("projects.xml")//person)
    let $numProjects := count(doc("projects.xml")//project)
    let $avgMembers := $numPeople div $numProjects
    
    for $project in doc("projects.xml")//project
        return $project[(platform/@name = "PHP") and count(.//person) lt $avgMembers]
}</projects>
