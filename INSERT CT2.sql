/*select
	*
from CT2010 WITH(NOLOCK)
WHERE CT2_DATA > 20250401
	AND (CT2_FILIAL BETWEEN 017400 AND 017499
	AND CT2_HIST LIKE 'BX TIT%'
	AND CT2_DATA > 20250401
	AND CT2_AT03DB in( '000008162','000040072'))

	OR (CT2_FILIAL BETWEEN 016900 AND 016999
	AND CT2_HIST LIKE 'BX TIT%'
	AND CT2_DATA > 20250401
	AND CT2_AT03DB IN(
'001640667',
'000147685',
'000007719',
'000010155',
'000000058',
'000040332',
'000989814',
'000051001',
'000007545',
'000000054',
'000028940',
'000209657',
'000000167',
'000018896',
'000000095',
'000000027',
'000051188',
'000005197',
'000007234',
'001646549'
	))

	OR (CT2_FILIAL BETWEEN 014000 AND 014099
	AND CT2_HIST LIKE 'BX TIT%'
	AND CT2_DATA > 20250401
	AND CT2_AT03DB IN ('000000007','000000108'))*/
/*
		AND E5_NUMERO IN(
--**'001631390'
--**'000099036'
'000099077'
--'000023249'
--'000098859'
--'000006368'
--'000098860'
		)*/

DROP TABLE #lancamentosCT2

DECLARE @selectNoTracker AS VARCHAR(3) = 'N'
DECLARE @inserirNaCT2 AS VARCHAR(2) = 'S'
DECLARE @selectNaTemporaria AS VARCHAR(2) = 'S'
DECLARE @numero AS VARCHAR(10) = '001643044'
DECLARE @filial AS VARCHAR(10) = '019510'
DECLARE @recnoCt2 AS INT

SELECT
	@recnoCt2 = MAX(R_E_C_N_O_) + 1
FROM CT2010 WITH(NOLOCK)
 PRINT @recnoCt2

--select * from CT2010 with(nolock) where R_E_C_N_O_ = @recnoCt2

CREATE TABLE #lancamentosCT2 (
	CT2_FILIAL	varchar	(6),
	CT2_DATA	varchar	(8),
	CT2_LOTE	varchar	(6),
	CT2_SBLOTE	varchar	(3),
	CT2_DOC	varchar	(6),
	CT2_LINHA	varchar	(3),
	CT2_MOEDLC	varchar	(2),
	CT2_DC	varchar	(1),
	CT2_DEBITO	varchar	(20),
	CT2_CREDIT	varchar	(20),
	CT2_DCD	varchar	(1),
	CT2_DCC	varchar	(1),
	CT2_VALOR	float	NULL,
	CT2_MOEDAS	varchar	(5),
	CT2_HP	varchar	(3),
	CT2_HIST	varchar	(40),
	CT2_CCD	varchar	(9),
	CT2_CCC	varchar	(9),
	CT2_ITEMD	varchar	(9),
	CT2_ITEMC	varchar	(9),
	CT2_CLVLDB	varchar	(9),
	CT2_CLVLCR	varchar	(9),
	CT2_ATIVDE	varchar	(40),
	CT2_ATIVCR	varchar	(40),
	CT2_EMPORI	varchar	(2),
	CT2_FILORI	varchar	(6),
	CT2_INTERC	varchar	(1),
	CT2_IDENTC	varchar	(50),
	CT2_TPSALD	varchar	(1),
	CT2_SEQUEN	varchar	(10),
	CT2_MANUAL	varchar	(1),
	CT2_ORIGEM	varchar	(100),
	CT2_ROTINA	varchar	(10),
	CT2_AGLUT	varchar	(1),
	CT2_LP	varchar	(3),
	CT2_SEQHIS	varchar	(3),
	CT2_SEQLAN	varchar	(3),
	CT2_DTVENC	varchar	(8),
	CT2_SLBASE	varchar	(1),
	CT2_DTLP	varchar	(8),
	CT2_DATATX	varchar	(8),
	CT2_TAXA	float	NULL,
	CT2_VLR01	float	NULL,
	CT2_VLR02	float	NULL,
	CT2_VLR03	float	NULL,
	CT2_VLR04	float	NULL,
	CT2_VLR05	float	NULL,
	CT2_CRCONV	varchar	(1),
	CT2_CRITER	varchar	(4),
	CT2_KEY	varchar	(200),
	CT2_SEGOFI	varchar	(10),
	CT2_DTCV3	varchar	(8),
	CT2_SEQIDX	varchar	(5),
	CT2_CONFST	varchar	(1),
	CT2_OBSCNF	varchar	(40),
	CT2_USRCNF	varchar	(15),
	CT2_DTCONF	varchar	(8),
	CT2_HRCONF	varchar	(10),
	CT2_MLTSLD	varchar	(20),
	CT2_CTLSLD	varchar	(1),
	CT2_CODPAR	varchar	(6),
	CT2_NODIA	varchar	(10),
	CT2_DIACTB	varchar	(2),
	CT2_MOEFDB	varchar	(2),
	CT2_MOEFCR	varchar	(2),
	CT2_USERGI	varchar	(17),
	CT2_USERGA	varchar	(17),
	CT2_AT01DB	varchar	(20),
	CT2_AT01CR	varchar	(20),
	CT2_AT02DB	varchar	(20),
	CT2_AT02CR	varchar	(20),
	CT2_AT03DB	varchar	(20),
	CT2_AT03CR	varchar	(20),
	CT2_AT04DB	varchar	(20),
	CT2_AT04CR	varchar	(20),
	CT2_LANCSU	varchar	(3),
	CT2_GRPDIA	varchar	(3),
	CT2_LANC	varchar	(15),
	CT2_CODCLI	varchar	(6),
	CT2_CODFOR	varchar	(6),
	CT2_CTRLSD	varchar	(1),
	D_E_L_E_T_	varchar	(1),
	R_E_C_N_O_	bigint	NULL,
	R_E_C_D_E_L_ bigint	NULL,
	CT2_ZREFDB	varchar	(30),
	CT2_ZREFCR	varchar	(30),
	CT2_ZCODFO	varchar	(6),
	CT2_ZNOMEF	varchar	(60),
	CT2_ZCONTR	varchar	(15),
	CT2_ZFILDE	varchar	(40),
	CT2_ZCCDDE	varchar	(40),
	CT2_ZCCCDE	varchar	(40),
	CT2_ZCTDDE	varchar	(40),
	CT2_ZCTCDE	varchar	(40),
	CT2_ZDESNA	varchar	(30),
	CT2_ZDESPR	varchar	(30),
	CT2_ESTCAN	varchar	(1),
	CT2_IDCONC	varchar	(23),
	CT2_INCONS	varchar	(1),
	CT2_PROCES	varchar	(32),
	CT2_INCDET	varbinary	NULL,
	CT2_MSUIDT	uniqueidentifier	NULL,
)

INSERT INTO #lancamentosCT2 
	SELECT
		E2_FILIAL,						--CT2_FILIAL	
		20250426,						--CT2_DATA	
		'008850',						--CT2_LOTE	
		'FIP',							--CT2_SBLOTE	
		'000001',						--CT2_DOC	
		'02',							--CT2_LINHA	
		'01',							--CT2_MOEDLC	
		3,								--CT2_DC	
		'49920100010017',				--CT2_DEBITO	
		A6_CONTA,						--CT2_CREDIT	
		'',								--CT2_DCD	
		'',								--CT2_DCC	
		E2_VALOR,						--CT2_VALOR	
		'',								--CT2_MOEDAS	
		'',								--CT2_HP	
		'BX TIT PG ' + TRIM(E2_NUM) + ' ' + TRIM(E2_NOMFOR),			--CT2_HIST	
		'',								--CT2_CCD	
		'',								--CT2_CCC	
		'',								--CT2_ITEMD	
		'',								--CT2_ITEMC	
		'',								--CT2_CLVLDB	
		'',								--CT2_CLVLCR	
		'',								--CT2_ATIVDE	
		SUBSTRING(TRIM(E2_HIST),0,40),	--CT2_ATIVCR	
		'01',							--CT2_EMPORI	
		E2_FILIAL,						--CT2_FILORI	
		'',								--CT2_INTERC	
		'',								--CT2_IDENTC	
		1,								--CT2_TPSALD	
		'000',							--CT2_SEQUEN	
		2,								--CT2_MANUAL	
		'paulo.jose 532/310',			--CT2_ORIGEM	
		'FINA370', 						--CT2_ROTINA	
		2,								--CT2_AGLUT	
		532,							--CT2_LP	
		'001',							--CT2_SEQHIS	
		'01',							--CT2_SEQLAN ----------- analisar	
		'',								--CT2_DTVENC	
		'',								--CT2_SLBASE	
		'',								--CT2_DTLP	
		'',								--CT2_DATATX	
		'0',							--CT2_TAXA	
		E2_VALOR,						--CT2_VLR01	
		0,								--CT2_VLR02	
		0,								--CT2_VLR03	
		0,								--CT2_VLR04	
		0,								--CT2_VLR05	
		1,								--CT2_CRCONV	
		'',								--CT2_CRITER	                                                                                                                                                            
		TRIM(E2_FILIAL) + 'VL' + TRIM(E2_PREFIXO) + E2_NUM + '  ' + TRIM(E2_TIPO) + ' ' + TRIM(E2_VENCTO) + E2_FORNECE + '0101',							--CT2_KEY	-------------- analisar
		'',								--CT2_SEGOFI	
		20250526,						--CT2_DTCV3	
		'',								--CT2_SEQIDX	
		'',								--CT2_CONFST	
		'',								--CT2_OBSCNF	
		'',								--CT2_USRCNF	
		'',								--CT2_DTCONF	
		'',								--CT2_HRCONF	
		'',								--CT2_MLTSLD	
		'0',							--CT2_CTLSLD	
		'',								--CT2_CODPAR	
		'',								--CT2_NODIA	
		'',								--CT2_DIACTB	
		'',								--CT2_MOEFDB	
		'',								--CT2_MOEFCR	
		' 0#  9@< 60{ 403 ',			--CT2_USERGI	
		' 0#  9@< 60{ 403 ',			--CT2_USERGA	
		E2_FORNECE,						--CT2_AT01DB	
		E2_NATUREZ,						--CT2_AT01CR	
		E2_TIPO,						--CT2_AT02DB	
		E2_PREFIXO,						--CT2_AT02CR	
		E2_NUM,							--CT2_AT03DB	
		'MATA100',						--CT2_AT03CR	
		'4400',							--CT2_AT04DB	
		'00000000000000000000',			--CT2_AT04CR	
		'',								--CT2_LANCSU	
		'',								--CT2_GRPDIA	
		'',								--CT2_LANC	
		'',								--CT2_CODCLI	
		'',								--CT2_CODFOR	
		'2',							--CT2_CTRLSD	
		'',								--D_E_L_E_T_	
		CASE 
			WHEN EXISTS(
				SELECT 1
				FROM CT2010 WITH(NOLOCK)
				WHERE R_E_C_N_O_ = @recnoCt2
			)THEN @recnoCt2 + 1 
		 ELSE @recnoCt2 
		 END,							--R_E_C_N_O_	
		0,								--R_E_C_D_E_L_
		'',								--CT2_ZREFDB	
		'',								--CT2_ZREFCR	
		'',								--CT2_ZCODFO	
		'',								--CT2_ZNOMEF	
		'',								--CT2_ZCONTR	
		'',								--CT2_ZFILDE	
		'',								--CT2_ZCCDDE	
		'',								--CT2_ZCCCDE	
		'',								--CT2_ZCTDDE	
		'',								--CT2_ZCTCDE	
		'',								--CT2_ZDESNA	
		'',								--CT2_ZDESPR	
		'',								--CT2_ESTCAN	
		'',								--CT2_IDCONC	
		2,								--CT2_INCONS	
		'',								--CT2_PROCES	
		NULL,							--CT2_INCDET	
		NULL							--CT2_MSUIDT	----------------- ANALISAR
	FROM SE2010 WITH(NOLOCK)
	INNER JOIN SE5010 SE5 WITH(NOLOCK)
		ON E5_PREFIXO = E2_PREFIXO  
		AND E5_NUMERO = E2_NUM 
		AND E5_PARCELA = E2_PARCELA  
		AND E5_TIPO = E2_TIPO  
		AND E5_FORNECE = E2_FORNECE  
		AND E5_LOJA = E2_LOJA
	INNER JOIN SA6010 WITH(NOLOCK)
		ON A6_FILIAL = SUBSTRING(TRIM(E5_FILIAL),0,5)
		AND A6_COD = E5_BANCO
		AND A6_AGENCIA = E5_AGENCIA
		AND A6_NUMCON = E5_CONTA
		AND A6_COD = E2_PORTADO
	WHERE E5_DATA BETWEEN 20250401 AND 20250430
		AND E5_FILIAL = @filial
		AND E5_NUMERO = @numero

		

		IF @selectNaTemporaria = 'S'
		BEGIN
			SELECT
				R_E_C_N_O_,
				*
			FROM #lancamentosCT2

			PRINT @inserirNaCT2

			IF @inserirNaCT2 = 'S' AND NOT EXISTS(
				SELECT 1
				FROM CT2010
				WHERE R_E_C_N_O_ = @recnoCt2
			)
			BEGIN
				INSERT INTO CT2010
				SELECT
					*
				FROM #lancamentosCT2
			
				SELECT 'INSERIU NA CT2 COM O RECNO ' + @recnoCt2
				
			END
			ELSE
			BEGIN
				SELECT 'NÃO INSERIU'
			END
		END
		ELSE IF @inserirNaCT2 = 'S'
		BEGIN
			IF NOT EXISTS(
				SELECT 1
				FROM CT2010
				WHERE R_E_C_N_O_ = @recnoCt2
			)
			BEGIN
				INSERT INTO CT2010
				SELECT
					*
				FROM #lancamentosCT2

				SELECT 
					'INSERIU' AS INSERIU,
					R_E_C_N_O_,
					* 
				FROM CT2010 WITH(NOLOCK) 
				WHERE R_E_C_N_O_ in(SELECT R_E_C_N_O_ FROM #lancamentosCT2)
					AND CT2_AT03DB = @numero
			END
			ELSE
			BEGIN
				SELECT 'Recno já existe na CT2' AS CT2
			END
		END
		ELSE IF @selectNoTracker = 'S'
		BEGIN
			SELECT
				*
			FROM CV3010 WITH(NOLOCK)
			WHERE CV3_FILIAL = @filial
				AND CV3_AT03DB = @numero	
		END	
		ELSE
		BEGIN
			SELECT 'Não inseriu na ct2'
		END

		/*
		SELECT * FROM CT2010 WITH(NOLOCK) WHERE R_E_C_N_O_ in(SELECT R_E_C_N_O_ FROM #lancamentosCT2)
		
		UPDATE CV3010
		SET CV3_RECDES = @recnoCt2
		WHERE R_E_C_N_O_ = 8359598
			
		*/
		

