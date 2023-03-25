USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getNumberOfHalfActiveMenu]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getNumberOfHalfActiveMenu]()
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	Declare @to_return int
	Select @to_return=Count(*) from menu Where in_menu=1
	return @to_return/2
END
GO
