USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getOrderValue]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[getOrderValue](@id int)
RETURNS money 
AS
BEGIN
RETURN (SELECT TotalPrice FROM OrdersInfo
WHERE order_id = @id)
END
GO
