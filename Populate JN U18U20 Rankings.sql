truncate table JN_U18U20_RANKING;

insert into JN_U18U20_RANKING (Rank,Season,USSA_Num, NENSA_Num,Athlete_Name,Sex,Club_Name,Age_Group,Num_Races,1stBest_Race_Pts,2ndBest_Race_Pts,3rdBest_Race_Pts,4thBest_Race_Pts,Best2_Avg_Pts,Best3_Avg_Pts,Best4_Avg_Pts)
SELECT @rownum:=@rownum + 1 as Ranking, 
       t.*
FROM ( 
   SELECT * FROM nensa_results_2017.member_season_u20_jn_rankings 
   WHERE Sex = 'M'
   order by -Avg_4_Best desc, -Avg_3_Best desc, -Avg_2_Best desc, Best_USSA_Result
) t,
(SELECT @rownum := 0) r;

insert into JN_U18U20_RANKING (Rank,Season,USSA_Num, NENSA_Num,Athlete_Name,Sex,Club_Name,Age_Group,Num_Races,1stBest_Race_Pts,2ndBest_Race_Pts,3rdBest_Race_Pts,4thBest_Race_Pts,Best2_Avg_Pts,Best3_Avg_Pts,Best4_Avg_Pts)
SELECT @rownum:=@rownum + 1 as Ranking, 
       t.*
FROM ( 
   SELECT * FROM nensa_results_2017.member_season_u20_jn_rankings 
   WHERE Sex = 'F'
   order by -Avg_4_Best desc, -Avg_3_Best desc, -Avg_2_Best desc, Best_USSA_Result
) t,
(SELECT @rownum := 0) r;