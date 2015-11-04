let $javaPersonsDoc := doc("projects.xml")//project[platform/@name = "Java"]//person/@document
let $individualDocs := distinct-values($javaPersonsDoc)
for $doc in $individualDocs
return data(doc("persons.xml")//person[@document = $doc])
