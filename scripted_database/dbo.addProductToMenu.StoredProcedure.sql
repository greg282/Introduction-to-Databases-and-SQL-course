USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[addProductToMenu]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addProductToMenu] @price money,@in_menu bit,@in_menu_start datetime,
@in_menu_end datetime,@desc varchar(100),@name_of_dish nchar(20),@reorder_level int,@units_in_stock int,@is_seafood Bit
AS
BEGIN
	SET NOCOUNT ON;
			Execute dbo.addDish @name_of_dish
				BEGIN TRY
			IF NOT EXISTS(
			SELECT *
			FROM dishes
			WHERE @name_of_dish = dish_name
			)
			BEGIN
			;
			THROW 52000, 'Nie ma takiego dania', 1
			END
			DECLARE @dish_name INT
			SELECT @dish_name = id_dish_name
			FROM dishes
			WHERE dish_name = @name_of_dish

			Declare @id_dish INT
			Select	@id_dish=ISNULL(MAX(id_dish), 0) + 1
			From menu
			INSERT INTO warehouse(id_dish,units_in_stock,reorder_level)
			VALUES (@id_dish,@units_in_stock,@reorder_level);
			INSERT INTO menu(id_dish,price,dish_name,in_menu,in_menu_start,in_menu_end,description,is_seafood)
			VALUES (@id_dish, @price, @dish_name, @in_menu, @in_menu_start,@in_menu_end,@desc,@is_seafood);
			END TRY
			BEGIN CATCH
			DECLARE @msg nvarchar(2048)
			=N'Error:' + ERROR_MESSAGE();
			THROW 52000, @msg, 1
			END CATCH


END
GO
