-- https://topsic-contest.jp/contests/contest00x/problems/contest003-2

INSERT INTO CONVENI_SALE_2018 (SURVEY_YEAR, PF_CODE, TOTAL_VALUE)
select
    SURVEY_YEAR,
    PF_CODE,
    TOTAL_VALUE
from
    CONVENIENCE
where 
1=1
and kind_code = '100'
and SURVEY_YEAR = 2018
and TOTAL_VALUE is not NULL
;
