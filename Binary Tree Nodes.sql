/*
Solving the SQL Binary Tree Nodes problem on HackerRank in ORACLE SQL

https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

Using Case with subquery to simplify logic.
*/

select n,
case
when p is null then 'Root'
when (select count(*) from BST where P = B.n)>0 then 'Inner'
else 'Leaf' end
from BST b
order by n;