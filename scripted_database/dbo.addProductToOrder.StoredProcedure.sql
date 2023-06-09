USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[addProductToOrder]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addProductToOrder] @orderId int,@quantity int,@dish_name nchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
			SET NOCOUNT ON;
			BEGIN TRY
		IF NOT EXISTS(
		SELECT *
		FROM menu
		inner join dishes on dishes.id_dish_name=menu.dish_name
		WHERE dishes.dish_name=@dish_name
		)
		BEGIN
		;
		THROW 52000, 'Nie ma takiego dania', 1
		END

		Declare @is_seafood Bit
		SELECT @is_seafood=menu.is_seafood
		FROM menu
		inner join dishes on dishes.id_dish_name=menu.dish_name
		WHERE dishes.dish_name=@dish_name


		IF NOT EXISTS(
		SELECT *
		FROM Orders
		WHERE order_id = @OrderID
		)
		BEGIN
		;
		THROW 52000, 'Nie ma takiego zamowienia', 1
		END

		Declare @id INT
		SELECT @id = ISNULL(MAX(id), 0) + 1
		FROM OrderDetails

		Declare @id_dish INT
		SELECT @id_dish=menu.id_dish
		FROM menu
		inner join dishes on dishes.id_dish_name=menu.dish_name
		WHERE dishes.dish_name=@dish_name

		INSERT INTO OrderDetails(id,order_id,quantity,id_dish)
		VALUES (@id,@orderId,@quantity,@id_dish)
		
		
		END TRY
		BEGIN CATCH
		DECLARE @msg nvarchar(2048)
		=N'Błąd dodania produktu do zamowienia: ' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH
    -- Insert statements for procedure here
END
GO
