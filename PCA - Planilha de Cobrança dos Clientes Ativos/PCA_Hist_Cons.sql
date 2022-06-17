SELECT 

CAST(LEFT(CAST(A.VDPEDIPE_NIT AS VARCHAR(300)),4) || '/' || SUBSTRING(CAST(A.VDPEDIPE_NIT AS VARCHAR(300)),5,2) ||'/' || SUBSTRING(CAST(A.VDPEDIPE_NIT AS VARCHAR(300)),7,2) || '-' || SUBSTRING(CAST(A.VDPEDIPE_NIT AS VARCHAR(300)),9,4) AS VARCHAR(300)) AS 'NUM.PEDIDO',

 CAST(LEFT(CAST(B.VDPEDCPE_DTEMIPED AS VARCHAR(300)),4) || SUBSTRING(CAST(B.VDPEDCPE_DTEMIPED AS VARCHAR(300)),5,2) || RIGHT(CAST(B.VDPEDCPE_DTEMIPED AS VARCHAR(300)),2) AS DATE) AS 'DATA DE EMISSÃO',
 
  A.VDPEDIPE_CODCLI AS 'COD. CLI',


CASE
         WHEN A.VDPEDIPE_CFAM = 60
         
         THEN A.VDPEDIPE_QTDPRD
   END AS '600ML',

CASE
         WHEN A.VDPEDIPE_CODR = 903482 

         THEN A.VDPEDIPE_QTDPRD
   END AS 'HEIN.600ML',

CASE
         WHEN A.VDPEDIPE_CFAM = 61 
         
         THEN A.VDPEDIPE_QTDPRD
   END AS '300ML',

CASE
         WHEN A.VDPEDIPE_CFAM = 25 
         OR
         A.VDPEDIPE_CFAM = 26

         THEN A.VDPEDIPE_QTDPRD
   END AS '1L',


CASE
         WHEN A.VDPEDIPE_CODR = 100559 
         OR 
         A.VDPEDIPE_CODR = 100579 
         OR 
         A.VDPEDIPE_CODR = 171690

         THEN A.VDPEDIPE_QTDPRD
   END AS 'REFR. PEQ',

CASE
         WHEN A.VDPEDIPE_CODR = 198579 
         OR 
         A.VDPEDIPE_CODR = 50473 
         OR 
         A.VDPEDIPE_CODR = 50475 
         OR 
         A.VDPEDIPE_CODR = 171620 
         OR 
         A.VDPEDIPE_CODR = 99900018 
         OR 
         A.VDPEDIPE_CODR = 197061 
         OR 
         A.VDPEDIPE_CODR = 197196 
         OR 
         A.VDPEDIPE_CODR = 33422 
         THEN A.VDPEDIPE_QTDPRD
   END AS 'REFR. GRANDE'


FROM PEDIT01 AS A
INNER JOIN PEDCP01 AS B ON A.VDPEDIPE_NIT=B.VDPEDCPE_NPED

WHERE B.VDPEDCPE_MOTDEV < '01' AND B.VDPEDCPE_FL = 8