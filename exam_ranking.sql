-- student_exam_ranking
-- Add solution code below 
SELECT 
	attendance,
	hours_studied,
	sleep_hours,
	tutoring_sessions,
	DENSE_RANK() OVER
			(ORDER BY exam_score DESC) as exam_rank
FROM student_performance
ORDER BY exam_rank
LIMIT 30;
