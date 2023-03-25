USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPriceOfCurrentMenu]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAvgPriceOfCurrentMenu]()
RETURNS money
AS
BEGIN
RETURN (SELECT AVG(price) FROM CurrentMenu)
END
GO
