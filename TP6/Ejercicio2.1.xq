<projects>{
for $project in doc("projects.xml")//project
    let $projectName := $project/@name
    let $clientName := $project/client/@name
    return <project name="{$projectName}">
               {doc("clients.xml")//client[@name = $clientName]}
               {$project/dates}
               {$project/platform}
               <staff>
                 {
                   for $person in $project/staff/person
                     return doc("persons.xml")//person[@document = $person/@document]
                 }
               </staff>
           </project>
}</projects>
