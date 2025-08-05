# Write your MySQL query statement below
delete p1
from Person p1
join Person p2
on p1.email = p2.email
 AND p1.id > p2.id;

use self-join the table:
p1 is the row to be deleted.
p2 is the row with the same email but smaller id (which we want to keep).
p1.id > p2.id ensures you only delete duplicates after the first occurrence.




