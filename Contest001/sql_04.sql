-- https://topsic-contest.jp/contests/contest001/problems/contest001-4

with base as(
    select
        for.pf_code,
        for.nation_code,
        na.nation_name,
        sum(for.amt) as amt
    from
        foreigner for left
        join
            nationality na
        on  for.nation_code = na.nation_code
    where
        1 = 1
    and for.nation_code not in (113)
    group by
        for.pf_code,
        for.nation_code
    order by
        sum(for.amt) desc
),
base_02 as (select
    base.pf_code, 
    base.nation_name, 
    base.amt,
    row_number() over (partition by base.pf_code) as rank
from
    base
)
select 
    base_02.pf_code 都道府県コード	,
    pref.pf_name 都道府県名	,
    max(case when rank = 1 then nation_name else '-' end) as  '1位 国名',
    sum(case when rank = 1 then amt else 0 end) as '1位 人数',
    max(case when rank = 2 then nation_name else '-' end) as '2位 国名',
    sum(case when rank = 2 then amt else 0 end) as '2位 人数',
    max(case when rank = 3 then nation_name else '-' end) as '3位 国名',
    sum(case when rank = 3 then amt else 0 end) as '3位 人数',
    sum(amt) as '合計人数'
from base_02
left join prefecture pref
on base_02.pf_code = pref.pf_code
where
    1=1
    --and base_02.pf_code in (13000, 27000)
    --and base_02.rank <= 3
group by base_02.pf_code
order by 
sum(amt) desc, 
base_02.pf_code
;