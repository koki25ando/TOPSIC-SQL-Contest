-- https://topsic-contest.jp/contests/contest001/problems/contest001-1

select
    DISTRICT_CODE as 地区コード, 
    DISTRICT_NAME as 地区名,
    sum(total_amt) as 総人口
from
    population
group by 
    DISTRICT_CODE, DISTRICT_NAME
order by 
    sum(total_amt) desc,
    DISTRICT_CODE desc
;