USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitInts]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[SplitInts]
(	
	@List    VARCHAR(MAX),
    @Delimiter  CHAR(1)
)

RETURNS TABLE 
AS
RETURN 
(
	SELECT Item = CONVERT(INT, Item)
       FROM
       (
           SELECT Item = x.i.value('(./text())[1]', 'INT')
           FROM
           (
               SELECT [XML] = CONVERT(XML, '<i>' 
                    + REPLACE(@List, @Delimiter, '</i><i>') 
                    + '</i>').query('.')
           ) AS a
           CROSS APPLY
           [XML].nodes('i') AS x(i)
       ) AS y
       WHERE Item IS NOT NULL
)
GO
