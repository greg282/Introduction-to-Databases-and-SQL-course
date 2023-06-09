USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[getOutDatedMenu]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getOutDatedMenu]()
RETURNS table
AS

RETURN (SELECT id_dish,dish_name, in_menu_start, in_menu_end from CurrentMenu where DATEDIFF(DAY, GETDATE(), in_menu_start) > 14 or DATEDIFF(DAY, in_menu_start, in_menu_end) > 14)

GO
