/*
-- Use this code to roll multiple rows into one row seperated by a comma

Old Table
ClaimNumber ClaimantName1
CN100		Matt
CN100       Pete
Cn100		Mike

New Table
ClaimNumber ClaimantNames
CN100		Matt, Pete, Mike

*/

select p1.ClaimNumber,										
stuff( (select ', ' + ClaimantName1 										
        from #basket_temp3_mjc as p2										
        where p2.ClaimNumber = p1.ClaimNumber										
        order by ClaimantName1 FOR XML PATH(''), TYPE).value('.', 'varchar(max)') ,1,1,'') as ClaimantNames																			
from #basket_temp3_mjc as p1										
group by ClaimNumber										
