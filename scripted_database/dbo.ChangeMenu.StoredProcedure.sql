USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[ChangeMenu]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChangeMenu]  @end_date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--Zmienia Rzeczy przedawnione z menu
	SET NOCOUNT ON;

	Declare @how_much_to_add int

	Declare @table as Table (id_dish int)
	Insert into @table 
	select t1.id_dish from getOutDatedMenu() as t1

	Select @how_much_to_add=Count(*) from @table

	Begin Try
	update menu
	set in_menu=0
	from menu inner Join (select * from menu where id_dish in (Select id_dish from @table) ) as t on t.id_dish=menu.id_dish

	END TRY
		BEGIN CATCH
		DECLARE @msg nvarchar(2048)
		=N'Error:' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH

	Begin Try
	update menu
	set in_menu=1,in_menu_start=GETDATE(),in_menu_end=@end_date
	from menu inner Join (select top (@how_much_to_add) * from menu where in_menu=0 and id_dish not in(Select id_dish from @table)) as t on t.id_dish=menu.id_dish

	END TRY
		BEGIN CATCH
		Declare @msg1 nvarchar(2048) =N'Error:' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH

    -- Insert statements for procedure here
	
END
GO
