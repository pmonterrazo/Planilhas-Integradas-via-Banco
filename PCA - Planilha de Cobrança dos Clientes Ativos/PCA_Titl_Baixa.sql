SELECT A.CRMOVBAI_CCLI AS 'COD. CLIENTE', A.CRMOVBAI_NDUPL AS 'NUM. DUPLICATA', A.CRMOVBAI_VALOR AS 'VALOR DO TITULO',

CAST(RIGHT(CAST(A.CRMOVBAI_DTP AS VARCHAR(300)),2) || '/' || SUBSTRING(CAST(A.CRMOVBAI_DTP AS VARCHAR(300)),5,2) || '/' || LEFT(CAST(A.CRMOVBAI_DTP AS VARCHAR(300)),4) AS VARCHAR(300)) AS 'DATA PAGAMENTO',

CAST(RIGHT(CAST(A.CRMOVBAI_DTE AS VARCHAR(300)),2) || '/' || SUBSTRING(CAST(A.CRMOVBAI_DTE AS VARCHAR(300)),5,2) || '/' || LEFT(CAST(A.CRMOVBAI_DTE AS VARCHAR(300)),4) AS VARCHAR(300)) AS 'DATA EMISSAO',

CAST(RIGHT(CAST(A.CRMOVBAI_DTV AS VARCHAR(300)),2) || '/' || SUBSTRING(CAST(A.CRMOVBAI_DTV AS VARCHAR(300)),5,2) || '/' || LEFT(CAST(A.CRMOVBAI_DTV AS VARCHAR(300)),4) AS VARCHAR(300)) AS 'DATA VENCIMENTO'

FROM CADBAI01 AS A

WHERE CAST(LEFT(CAST(A.CRMOVBAI_DTE AS VARCHAR(300)),4) || SUBSTRING(CAST(A.CRMOVBAI_DTE AS VARCHAR(300)),5,2) || SUBSTRING(CAST(A.CRMOVBAI_DTE AS VARCHAR(300)),7,2) AS DATE) >= ADD_DAYS(CURDATE(),-DAYS_BETWEEN(CURDATE(),ADD_MONTHS(CURDATE(),-3)))