USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[ChangeHalfMenu]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[ChangeHalfMenu] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare  @how_much_to_swap int=dbo.getNumberOfHalfActiveMenu()

	Declare @table as Table (id_dish int,price money,dish_name int,in_menu bit,in_menu_start datetime,in_menu_end datetime,description varchar(100),is_seafood bit)
	
	Insert into @table 
	select top (@how_much_to_swap) * from menu where in_menu=0 
	Begin Try
	update menu
	set in_menu=1
	from menu inner Join (select top (@how_much_to_swap) * from menu where in_menu=0 ) as t on t.id_dish=menu.id_dish

	END TRY
		BEGIN CATCH
		DECLARE @msg nvarchar(2048)
		=N'Error:' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH

	Begin Try
	update menu
	set in_menu=0
	from menu inner Join (select top (@how_much_to_swap) * from menu where in_menu=1 and id_dish not in(Select id_dish from @table)) as t on t.id_dish=menu.id_dish

	END TRY
		BEGIN CATCH
		Declare @msg1 nvarchar(2048) =N'Error:' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH

    -- Insert statements for procedure here
	
END
GO
