CREATE OR REPLACE VIEW MEMBER_SEASON_U16_JN_RANKINGS AS
SELECT s.season as 'Season', e.ussa_num as 'USSA_num', 
        m.nensa_num as 'NENSA', e.full_name as 'Athletes_Name', 
        m.sex as 'Sex', s.club_name as 'Club_Name', s.age_group as 'Age_Group',
        COUNT(e.WC_Points) as '#_Races',
        MIN(e.WC_Points) as 'Best_Race_Result',
        (SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id AND WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 0,1) as 'Best_WC_Points',
        (SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id and WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 1,1) as '2ndBest_WC_Points',
        (SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id and WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 2,1) as '3rdBest_WC_Points',
        (((SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id AND WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 0,1)+(SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id and WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 1,1))/2) as "Avg_2_Best",
        (((SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id AND WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 0,1)+(SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id and WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 1,1))+(SELECT WC_Points
            FROM RACE_RESULTS
            WHERE member_season_id=s.id and WC_Points <> 0
            GROUP BY WC_Points HAVING COUNT(*) > 0
            ORDER BY WC_Points ASC
            LIMIT 2,1)/3) as "Avg_3_Best"
FROM 
    MEMBER_SEASON s
        INNER JOIN 
    RACE_RESULTS e ON e.member_season_id = s.id
        INNER JOIN 
    MEMBER_SKIER m ON m.member_id = s.member_id
WHERE e.WC_Points <> 0 AND s.age_group='U16' 
GROUP BY s.id;