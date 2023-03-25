USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMostQuantitySoldDish]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMostQuantitySoldDish]()
RETURNS table AS
RETURN
Select Top(1) * From SoldDishes Order By TotalQuantity Desc
GO
