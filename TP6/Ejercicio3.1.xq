<promedio>
{
    let $ages := doc("persons.xml")//age
    return avg($ages)
}
</promedio>
