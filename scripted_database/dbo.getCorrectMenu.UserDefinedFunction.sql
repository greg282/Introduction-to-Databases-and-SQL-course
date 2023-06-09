USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getCorrectMenu]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getCorrectMenu]()
RETURNS TABLE
AS
	RETURN(SELECT dishes.dish_name FROM menu inner join dishes on menu.id_dish = dishes.id_dish_name where DATEDIFF(day, in_menu_end, in_menu_start) < 15 and in_menu=1)
GO
