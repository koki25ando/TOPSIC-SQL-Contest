-- https://topsic-contest.jp/contests/practice/problems/practice001

select
    district_name as 都道府県名,
    sum(total_amt) as 総人口
from
    population
where lvl = 2
group by
    district_name
order by sum(total_amt) desc
;