declare function local:mayorATreinta($persona as node()) as xs:string
{
    if($persona/age > 30)
        then "Mayor a 30 años"
    else "Menor a 30 años"    
};

<persons>{
for $person in doc("persons.xml")//person
return <person document="{$person/document}">
       <firstname>{$person/firstname}</firstname>
       <lastname>{$person/lastname}</lastname>
       <age>{$person/age}</age>
       <categoria>{local:mayorATreinta($person)}</categoria>
       </person>
}</persons>
