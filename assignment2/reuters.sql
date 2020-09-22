-- part_a
SELECT COUNT(*)
FROM Frequency
WHERE docid = '10398_txt_earn';

-- part_b
SELECT COUNT(term)
FROM Frequency f
WHERE docid = '10398_txt_earn' AND count = 1;

-- part_c
SELECT count(*)
FROM (
	SELECT term
	FROM Frequency
	WHERE docid = '10398_txt_earn' AND count = 1
	UNION
	SELECT term 
	FROM Frequency
	WHERE docid = '925_txt_trade' AND count = 1
);

-- part_d
SELECT COUNT(DISTINCT docid)
FROM Frequency
WHERE term = 'law' OR term = 'legal';

-- part_e using group by
SELECT COUNT(*)
FROM (
	SELECT docid, SUM(count) AS total
	FROM Frequency 
	GROUP BY docid 
	HAVING total > 300
);

-- part_e using nested query (subquery)

SELECT COUNT(*)
FROM (
	SELECT docid, COUNT(term) AS total
	FROM Frequency
	GROUP BY docid
)
WHERE total > 300;

-- part_f 
SELECT COUNT(DISTINCT docid)
FROM (
	SELECT docid
	FROM Frequency
	WHERE term = 'transactions'
	INTERSECT
	SELECT docid
	FROM Frequency
	WHERE term = 'world'
);
