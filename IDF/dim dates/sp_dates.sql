
ALTER PROCEDURE sp_update_dim_date 
AS
set NOCOUNT ON
DECLARE @EndDate DATE =GETDATE()

declare @minDate date = (select MAX(FullDate)
FROM Dim_Dates)

IF @minDate is NULL
BEGIN
SET @minDate = '2010-01-01'
END

SET @minDate =DATEADD(DAY,1,@minDate)

DECLARE @CurrentDate DATE= @minDate 

WHILE @CurrentDate <= @EndDate
BEGIN
   INSERT INTO [dbo].[Dim_Dates] 
   		               
   SELECT [KeyDate] = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
		  [FullDate]=CAST (@CurrentDate AS DATE),
		  [KeyYear] = YEAR(@CurrentDate),
		  [CodeYear] = YEAR(@CurrentDate),
	      [DescYear] = CONVERT(VARCHAR, DATEPART(YEAR, @CurrentDate)),		     
	      [KeyMonth] = MONTH(@CurrentDate),
	      [CodeMonth]  = MONTH(@CurrentDate),
          [DescMonth] = DATENAME(mm, @CurrentDate),
		  [CodeDayInWeek] = DAY(@CurrentDate),
		  [DescDayInWeek] = DATENAME(dw, @CurrentDate)
	      

   SET @CurrentDate = DATEADD(Day, 1, @CurrentDate)
   END
EXEC sp_update_dim_date