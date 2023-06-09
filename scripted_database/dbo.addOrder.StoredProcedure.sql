USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[addOrder]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[addOrder] @client_id int,@taken_away bit,@destination_date datetime,@order_adress varchar(50),@quantity int,@dish_name nchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

			   BEGIN TRY
					DECLARE @OrderID INT
					SELECT @OrderID = ISNULL(MAX(order_id), 0) + 1
					FROM Orders
					INSERT INTO Orders(order_id, client_id, order_date, taken_away,pref_date_of_seafood)
					VALUES (@OrderID, @client_id,GETDATE(),@taken_away,null)
				execute addProductToOrder @OrderId , @quantity , @dish_name

					if(@taken_away=1)
						Begin
							DECLARE @takeaway_id INT
							SELECT @takeaway_id = ISNULL(MAX(take_away_id), 0) + 1
							FROM takeAway
							INSERT INTO takeAway(take_away_id,destination_date,order_adress,order_id)
							VALUES (@takeaway_id,@destination_date,@order_adress,@OrderID)
						END
				
					

			END TRY
			BEGIN CATCH
			DECLARE @msg nvarchar(2048)
			=N'Błąd dodawania zamówienia: ' + ERROR_MESSAGE();
			THROW 52000, @msg, 1
			END CATCH
	
END
GO
