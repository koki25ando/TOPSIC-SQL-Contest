-- https://topsic-contest.jp/contests/practice/problems/practice002
select
    pref.pf_code as 都道府県コード,
    pref.pf_name as 都道府県名,
    round((cast(sum(hos.inp_yes) as float)/cast(sum(hos.inp_yes) + sum(hos.inp_no) + sum(hos.unidentified) as float))*100, 1) as 入院率
from
    hospitalization as hos
    left join PREFECTURE as pref 
    on hos.pf_code = pref.pf_code
group by
    pref.pf_name
order by
    round((cast(sum(hos.inp_yes) as float)/cast(sum(hos.inp_yes) + sum(hos.inp_no) + sum(hos.unidentified) as float))*100, 1) desc
    , pref.pf_code;