USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMinPriceFromCurrentMenu]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMinPriceFromCurrentMenu]()
RETURNS money
AS
BEGIN
RETURN (SELECT TOP 1 MIN(price) FROM CurrentMenu)
END
GO
