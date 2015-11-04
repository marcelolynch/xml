for $project in doc("projects.xml")//project
let $pdata := $project/*
return <project name="{$project/@name}">
            {$pdata}
            <duration>{
            xs:date($project/dates/@to) - xs:date($project/dates/@from)
            }</duration>
       </project>
