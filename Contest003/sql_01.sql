-- https://topsic-contest.jp/contests/contest00x/problems/contest003-1

select
    PF_CODE as CODE,
    TOTAL_VALUE as SALES_AMT
from
    CONVENIENCE
where 
1=1
and kind_code = '100'
and SURVEY_YEAR = 2019
order by SALES_AMT desc, code asc
;