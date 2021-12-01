SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_dates](
	[KeyDate] [int] NOT NULL,
	[fulldate] [date] NULL,
	[KeyYear] [int] NOT NULL,
	[CodeYear] [int] NOT NULL,
	[DescYear] [nvarchar](50) NOT NULL,
	[KeyMonth] [int] NOT NULL,
	[CodeMonth] [int] NOT NULL,
	[DescMonth] [nvarchar](50) NOT NULL,
	[CodeDayInWeek] [int] NOT NULL,
	[DescDayInWeek] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
