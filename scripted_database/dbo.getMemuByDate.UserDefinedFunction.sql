USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getMemuByDate]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getMemuByDate](@date date)
RETURNS table
AS
	return
	select dish_name, price, in_menu_start, in_menu_end from menu where in_menu_start < @date and @date < in_menu_end
GO
