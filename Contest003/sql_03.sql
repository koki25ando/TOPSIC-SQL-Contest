-- https://topsic-contest.jp/contests/contest00x/problems/contest003-3

with base as(
    select
        class_code,
        class_name,
        PERSON_NAME,
        amt as total_amt,
        rank() OVER(PARTITION BY class_code ORDER BY amt DESC) as rank
    from
        HOUSEHOLD
    where
        1 = 1
    and PERSON_CODE != '1'
    and CLASS_CODE != '01'
    order by
        class_code,
        class_name,
        PERSON_NAME,
        rank
)
select
    class_name as CLASS,
    PERSON_NAME as PERSON,
    total_amt as HOUSEHOLDS
from
    base
where
    1=1
    and rank = 1
order by
    class_code asc
;
