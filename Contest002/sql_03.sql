-- https://topsic-contest.jp/contests/contest002/problems/contest002-3

select
    d.pf_code as CODE,
    p.pf_name as NAME,
    --sum(case when CATEGORY_CODE == '110' then amt else 0 end) as total,
    --sum(case when CATEGORY_CODE == '120' then amt else 0 end) as drink_total,
    round((cast(sum(case when CATEGORY_CODE == '120' and GENDER_CODE in ('2', '3') then amt else 0 end) as float) /
        cast(sum(case when CATEGORY_CODE == '110' and GENDER_CODE in ('2', '3') then amt else 0 end) as float))*100, 1)
    as PERCENTAGE
from
    drink_habits as d
    left join prefecture as p
    on d.pf_code = p.pf_code
--where code in ('05000', '02000')
group by 
    d.pf_code,
    p.pf_name
order by PERCENTAGE desc, d.pf_code desc
;