SELECT 
	t.sender,
    t.requestkey,
    td.data,
    td.code,
    t.result,
    t.creationtime
FROM 
    "TransactionDetails" td
JOIN 
    "Transactions" t 
    ON td."transactionId" = t.id
WHERE 
    t.creationtime BETWEEN --start and endtime in unix timestamp
    AND t."chainId" IN (1, 2)
    AND t.sender LIKE 'k:%'
    AND td.code::TEXT ~* 'kaddex';
