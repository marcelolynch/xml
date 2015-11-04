for $project in doc("projects.xml")//project
let $today := current-date()
where ($today > xs:date($project/dates/@from) and $today < xs:date($project/dates/@to))
return $project
