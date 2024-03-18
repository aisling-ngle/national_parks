SELECT StateID, COUNT(*) AS NumOfParks FROM us_np
	GROUP BY StateID
	ORDER BY NumOfParks DESC
	LIMIT 10;
    
SELECT us_np.StateID, us_np.ParkName, annual_visits.TotalVisits, econ_output.VisitorSpending, econ_output.JobsAdded, econ_output.EconomicOutput 
FROM us_np
JOIN annual_visits ON us_np.ParkID = annual_visits.ParkID
JOIN econ_output ON us_np.ParkID = econ_output.ParkID
WHERE annual_visits.VisitYear = econ_output.VisitYear
ORDER BY econ_output.EconomicOutput DESC;

SELECT StateID, COUNT(*) AS NumOfParks, SUM(Size) AS TotalArea FROM us_np
GROUP BY StateID
ORDER BY NumOfParks DESC, TotalArea DESC;

SELECT us_np.StateID, us_np.ParkName, annual_visits.TotalVisits, annual_visits.VisitYear
FROM us_np
JOIN annual_visits ON us_np.ParkID = annual_visits.ParkID
WHERE annual_visits.VisitYear = 2023
ORDER BY annual_visits.TotalVisits DESC
LIMIT 10;

SELECT * 
FROM (
    SELECT StateID, COUNT(*) AS NumOfParks, SUM(Size) AS TotalArea
    FROM us_np
    GROUP BY StateID WITH ROLLUP
) AS ParksSummary
WHERE NumOfParks > 2;

SELECT COUNT(DISTINCT StateID) FROM us_np;

SELECT *, RANK() OVER (ORDER BY Size DESC) AS Ranking FROM us_np;
