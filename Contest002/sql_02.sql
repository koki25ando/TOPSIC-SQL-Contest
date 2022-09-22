-- https://topsic-contest.jp/contests/contest002/problems/contest002-2

select
    DISTRICT_CODE as CODE, 
    DISTRICT_NAME as NAME, 
    total_amt as TOTAL
from
    population
where total_amt >= 100000
and DISTRICT_NAME like '%東%'
order by TOTAL desc, DISTRICT_CODE asc
;