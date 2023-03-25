USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMaxPriceFromCurrentMenu]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMaxPriceFromCurrentMenu]()
RETURNS money
AS
BEGIN
RETURN (SELECT TOP 1 MAX(Price) FROM CurrentMenu)
END
GO
