SELECT DISTINCT A.VDPEDCPE_CODCLI  AS 'COD. CLIENTE', CAST(SUBSTRING(CAST(A.VDPEDCPE_NPED AS VARCHAR(300)),9,5) AS VARCHAR(300)) AS 'PEDIDO'  , B.VDCLICLI_RAZAO50 AS 'RAZÃO SOCIAL', A.VDPEDCPE_VEN_ORI_CLI AS 'VD', D.VDVENVEN_SUPVD AS 'SUP',

CASE

      WHEN(A.VDPEDCPE_TPCOBR)  >= 4 THEN 'PRAZO'
      WHEN(A.VDPEDCPE_TPCOBR)  = 1 THEN 'A VISTA' END AS 'PRAZO', CAST(A.VDPEDCPE_CPG AS VARCHAR(300)) || ' - ' || CAST(E.VDCADPAG_DESCR AS VARCHAR(300)) AS 'COND. PG',

CASE

    WHEN(F.VDPEDIPE_OCOKD) >= 1 AND F.VDPEDIPE_OCOKD <= 2 THEN 'VEND/BONIF' 
    WHEN(A.VDPEDCPE_VLR_FCEM) = 0.00 THEN 'BONIFICAÇÃO' 
    WHEN(F.VDPEDIPE_OCOKD) = 50 THEN 'COMODATO'
    WHEN(F.VDPEDIPE_OCOKD) = 51 THEN 'COMODATO'
    WHEN(F.VDPEDIPE_OCOKD) = 40 THEN 'COMODATO F/E'
    WHEN(F.VDPEDIPE_OCOKD) = 72 THEN 'COMODATO F/E' END AS 'TIPO'

,A.VDPEDCPE_VLR_FCEM AS 'VLR. PEDIDO'


FROM PEDCP01 AS A
INNER JOIN CADCLI01 AS B ON CAST(A.VDPEDCPE_CODCLI AS VARCHAR(300))=CAST(VDCLICLI_REGI AS VARCHAR(300)) || REPEAT('0',4-LENGTH(CAST(VDCLICLI_NUM AS VARCHAR(300)))) || CAST(VDCLICLI_NUM AS VARCHAR(300))
INNER JOIN CADVEN01 AS D ON A.VDPEDCPE_VEN_ORI_CLI=D.VDVENVEN_CODMOV
INNER JOIN CONDPG01 AS E ON A.VDPEDCPE_CPG=E.VDCADPAG_COD
INNER JOIN PEDIT01 AS F ON A.VDPEDCPE_NPED=F.VDPEDIPE_NIT

WHERE CAST(LEFT(CAST(VDPEDCPE_NPED AS VARCHAR(300)),4) || SUBSTRING(CAST(VDPEDCPE_NPED AS VARCHAR(300)),5,2) || SUBSTRING(CAST(VDPEDCPE_NPED AS VARCHAR(300)),7,2) AS DATE) = CURDATE() AND A.VDPEDCPE_CANCHR = 0

GROUP BY A.VDPEDCPE_CODCLI, A.VDPEDCPE_NPED, B.VDCLICLI_RAZAO50,  A.VDPEDCPE_VEN_ORI_CLI, D.VDVENVEN_SUPVD, A.VDPEDCPE_TPCOBR, A.VDPEDCPE_CPG, E.VDCADPAG_DESCR, A.VDPEDCPE_VLR_FCEM, A.VDPEDCPE_CANCHR, F.VDPEDIPE_OCOKD
