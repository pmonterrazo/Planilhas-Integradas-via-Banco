SELECT REPEAT('0',3-LENGTH(A.VDPEDIPE_OCOKD)) AS 'OCORRENCIA',

SUM(A.VDPEDIPE_PREPRDT) AS 'VLR. DA OCORRENCIA'

FROM PEDIT01 AS A 
INNER JOIN PEDCP01 AS B ON A.VDPEDIPE_NIT=B.VDPEDCPE_NPED

WHERE MONTH(CAST(LEFT(CAST(VDPEDIPE_NIT AS VARCHAR(300)),4) ||  SUBSTRING(CAST(A.VDPEDIPE_NIT AS VARCHAR(300)),5,2) || SUBSTRING(CAST(VDPEDIPE_NIT AS VARCHAR(300)),7,2) AS DATE)) = MONTH(CURDATE()) AND B.VDPEDCPE_FL = 8 AND B.VDPEDCPE_MOTDEV < '01' AND YEAR(CAST(LEFT(CAST(VDPEDIPE_NIT AS VARCHAR(300)),4) ||  SUBSTRING(CAST(A.VDPEDIPE_NIT AS VARCHAR(300)),5,2) || SUBSTRING(CAST(VDPEDIPE_NIT AS VARCHAR(300)),7,2) AS DATE)) = YEAR(CURDATE())

GROUP BY A.VDPEDIPE_OCOKD