-- https://topsic-contest.jp/contests/contest001/problems/contest001-2

select
    main.age_code as 年齢コード,
    age.age_name as 年齢階層名,
    sum(SP_TIME_5) as '5時間未満',
    sum(SP_TIME_6) as '5時間以上6時間未満',
    sum(SP_TIME_7) as '6時間以上7時間未満',
    sum(SP_TIME_8) as '7時間以上8時間未満',
    sum(SP_TIME_9) as '8時間以上9時間未満',
    sum(SP_TIME_9OVER) as '9時間以上'
    
from
    SLEEP_TIME_DTL main
left join 
    PREFECTURE pref
on 
    main.pf_code = pref.pf_code
inner join 
    age_grp age
on 
    main.age_code = age.age_code
where 
    pref.PF_NAME in ('北海道', '青森県', '岩手県', '宮城県', '福島県') 
group by main.age_code
order by main.age_code
;