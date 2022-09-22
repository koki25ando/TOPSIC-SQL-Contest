-- https://topsic-contest.jp/contests/contest002/problems/contest002-1


update
    POPULATION
set 
    DISTRICT_NAME = '不明'
where DISTRICT_NAME is null or DISTRICT_NAME == '';
