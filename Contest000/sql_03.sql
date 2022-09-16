-- https://topsic-contest.jp/contests/practice/problems/practice003


select
    pref.pf_code as 都道府県コード, pref.pf_name as 都道府県名,
    sum( case when pop.survey_year = 2015 then pop.total_amt else null end) as 総人口2015年,
    sum( case when pop.survey_year = 2020 then pop.total_amt else null end) as 総人口2020年,
    round(cast(
        cast(sum( case when pop.survey_year = 2020 then pop.total_amt else null end) as float)/
        cast(sum( case when pop.survey_year = 2015 then pop.total_amt else null end) as float)
     as float), 2) * 100 as 人口増加率
from
    popu_transition as pop
left join 
    PREFECTURE as pref
on pop.pf_code = pref.pf_code
group by 
    pref.pf_code, pref.pf_name
    having cast(
        cast(sum( case when pop.survey_year = 2020 then pop.total_amt else null end) as float)/
        cast(sum( case when pop.survey_year = 2015 then pop.total_amt else null end) as float)
     as float) >= 1
    order by 
round(cast(
        cast(sum( case when pop.survey_year = 2020 then pop.total_amt else null end) as float)/
        cast(sum( case when pop.survey_year = 2015 then pop.total_amt else null end) as float)
     as float), 2)  desc, pref.pf_code