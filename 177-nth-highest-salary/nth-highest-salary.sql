CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select salary
      from
      (
        select salary,
        dense_rank() over(order by salary desc) as ranked
        from Employee
      ) as rankTable
      where ranked=n
      limit 1

      #or
     # select distinct salary 
      #from Employee
      #order by salary desc
      #limit 1 offset N-1
  );
END