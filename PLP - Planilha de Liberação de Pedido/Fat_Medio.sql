SELECT A.VDPEDCPE_CODCLI AS 'COD CLI', A.VDPEDCPE_NPED AS 'NUM PED', SUM(A.VDPEDCPE_VLR_FCEM) AS 'VLR TOTAL', CAST(LEFT(CAST(A.VDPEDCPE_DTEMIPED AS VARCHAR(300)),4) || SUBSTRING(CAST(A.VDPEDCPE_DTEMIPED AS VARCHAR(300)),5,2) || RIGHT(CAST(A.VDPEDCPE_DTEMIPED AS VARCHAR(300)),2) AS DATE) AS 'DATA DE EMISSAO'


FROM PEDCP01 AS A

WHERE A.VDPEDCPE_DTEMIPED >= 20211001 AND A.VDPEDCPE_DTEMIPED < 20220101

GROUP BY A.VDPEDCPE_NPED, A.VDPEDCPE_VLR_FCEM, A.VDPEDCPE_DTEMIPED, A.VDPEDCPE_CODCLI