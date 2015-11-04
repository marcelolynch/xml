<projects>{
    for $project in doc("projects.xml")//project
    order by $project/@name
    return $project[platform/@name = "Java"]
}
</projects>
