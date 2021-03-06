SELECT A.VDCEVPEN_NRCCEV AS "NUM. CONTRATO", A.VDCEVPEN_NPED AS 'NUM. PED', A.VDCEVPEN_CODCLI AS 'COD.CLIENTE', 

   CASE
         WHEN A.VDPEDIPE_CODR = 470 
         OR 
         A.VDPEDIPE_CODR = 2494

         THEN A.VDPEDIPE_QTDPRD
   END AS '600ML',

   CASE
         WHEN A.VDPEDIPE_CODR = 152594 
         OR 
         A.VDPEDIPE_CODR = 152597
         OR 
         A.VDPEDIPE_CODR = 152592
                  
         THEN A.VDPEDIPE_QTDPRD
   END AS '300ML',

   CASE
         WHEN A.VDPEDIPE_CODR = 107382 
         OR 
         A.VDPEDIPE_CODR = 107381
         OR 
         A.VDPEDIPE_CODR = 33313
         OR 
         A.VDPEDIPE_CODR = 107522
         OR 
         A.VDPEDIPE_CODR = 107523
   END AS '1L',

   CASE
         WHEN D.VDPEDIPE_CODR = 100559 
         OR 
         D.VDPEDIPE_CODR = 100579 
         OR 
         D.VDPEDIPE_CODR = 171690 
         
         THEN D.VDPEDIPE_QTDPRD
   END AS 'REFR. PEQ',

   CASE
         WHEN D.VDPEDIPE_CODR = 198579 
         OR 
         D.VDPEDIPE_CODR = 50473 
         OR 
         D.VDPEDIPE_CODR = 50475 
         OR 
         D.VDPEDIPE_CODR = 171620 
         OR 
         D.VDPEDIPE_CODR = 99900018 
         OR 
         D.VDPEDIPE_CODR = 197061 
         OR 
         D.VDPEDIPE_CODR = 197196 
         OR 
         D.VDPEDIPE_CODR = 33422 
         
         THEN D.VDPEDIPE_QTDPRD
   END AS 'REFR. GRD',

   CASE
      WHEN D.VDPEDIPE_CODR = 128425 THEN D.VDPEDIPE_QTDPRD
   END AS 'MESA PLAS.',

C.VDPRDPRD_DESCRI AS 'PRD. DESC', CAST(RIGHT(CAST(A.VDCEVPEN_DTV AS VARCHAR(300)),2) || '/' || SUBSTRING(CAST(A.VDCEVPEN_DTV AS VARCHAR(300)),5,2) || '/' || LEFT(CAST(A.VDCEVPEN_DTV AS VARCHAR(300)),4) AS VARCHAR(300)) AS 'VALIDADE',  A.VDCEVPEN_QTDPRD_ORI AS 'QUANT.'

FROM CEVPED01 AS A
INNER JOIN CADCLI01 AS B ON CAST(A.VDCEVPEN_CODCLI AS VARCHAR(300))=CAST(VDCLICLI_REGI AS VARCHAR(300)) || REPEAT('0',4-LENGTH(CAST(VDCLICLI_NUM AS VARCHAR(300)))) || CAST(VDCLICLI_NUM AS VARCHAR(300))
INNER JOIN PEDIT01 AS D ON A.VDCEVPEN_NPED=D.VDPEDIPE_NIT
INNER JOIN CADPRD01 AS C ON D.VDPEDIPE_CODR=C.VDPRDPRD_CODR

WHERE A.VDCEVPEN_DTE >= 20150101 AND A.VDCEVPEN_DTE < 20220101

GROUP BY A.VDCEVPEN_NRCCEV, A.VDCEVPEN_NPED, A.VDCEVPEN_CODCLI, D.VDPEDIPE_CODR, D.VDPEDIPE_QTDPRD, C.VDPRDPRD_DESCRI, A.VDCEVPEN_DTV, A.VDCEVPEN_QTDPRD_ORI