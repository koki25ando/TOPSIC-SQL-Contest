-- https://topsic-contest.jp/contests/practice/problems/practice004

select
    age_grp.age_name as 年齢階層,
    sum(case when time_code = 120 then target_pop else null end) as '5時間未満',
    sum(case when time_code = 130 then target_pop else null end) as '5時間以上6時間未満',
    sum(case when time_code = 140 then target_pop else null end) as '6時間以上7時間未満',
    sum(case when time_code = 150 then target_pop else null end) as '7時間以上8時間未満',
    sum(case when time_code = 160 then target_pop else null end) as '8時間以上9時間未満',
    sum(case when time_code = 170 then target_pop else null end) as '9時間以上',
    sum(case when time_code = 180 then target_pop else null end) as '不詳'
from
    SLEEP_TIME_DTL main
left join 
    age_grp
on main.age_code = age_grp.age_code
group by age_grp.age_name
order by age_grp.age_name;