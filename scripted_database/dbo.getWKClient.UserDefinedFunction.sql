USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getWKClient]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getWKClient](@input int)
RETURNS table
AS

RETURN (SELECT c.Expr1 from ClientOrderedXTimes as c where c.client_id = @input)

GO
