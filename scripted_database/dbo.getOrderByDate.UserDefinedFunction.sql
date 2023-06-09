USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getOrderByDate]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getOrderByDate](@date date)
RETURNS TABLE
AS
	return 
	(select dishes.dish_name from orders inner join OrderDetails on orders.order_id = OrderDetails.order_id
	inner join menu on menu.id_dish = OrderDetails.id_dish inner join dishes on dishes.id_dish_name = menu.dish_name
	where day(orders.order_date) = day(@date) and month(orders.order_date) = month(@date) and year(orders.order_date) = year(@date))
GO
