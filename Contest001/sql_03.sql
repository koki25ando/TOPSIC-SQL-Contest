-- https://topsic-contest.jp/contests/contest001/problems/contest001-3

select
    imi.port_code as 港コード,
    port.port_name as 港名,
    sum(case when kind_code = 110 then amt else 0 end) as 入国者数,
    sum(case when kind_code = 120 then amt else 0 end) as 出国者数,
    (sum(case when kind_code = 110 then amt else 0 end) - sum(case when kind_code = 120 then amt else 0 end)) as 差分
from
    immigration imi 
left join 
    port 
on imi.port_code = port.port_code
left join
    grp gp
on  imi.group_code = gp.group_code
where 
    1=1
    and gp.GROUP_CODE = 120
group by 
    imi.port_code,
    port.port_name
having (sum(case when kind_code = 110 then amt else 0 end) - sum(case when kind_code = 120 then amt else 0 end)) > 0
order by 
    (sum(case when kind_code = 110 then amt else 0 end) - sum(case when kind_code = 120 then amt else 0 end)) desc,
    port.port_code desc
    ;