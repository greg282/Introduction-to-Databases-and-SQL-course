USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[addReservation_IndividualClient]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addReservation_IndividualClient] @client_id int, @amount_people INT,
@start_date datetime,@end_date datetime,@approved bit,@quantity int,@dish_name nchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   BEGIN TRY
				IF NOT EXISTS(
				SELECT *
				FROM Clients
				WHERE client_id = @client_id
				)
				BEGIN
				;
				THROW 52000, 'Nie ma takiego klienta', 1
				end

				DECLARE @ReservationID INT
				SELECT @ReservationID = ISNULL(MAX(reservation_id), 0) + 1
				FROM reservations

				DECLARE @orderID INT
				SELECT @orderID = ISNULL(MAX(order_id), 0) + 1
				FROM orders

				Declare @table_id INT
				Select top 1 @table_id=table_id
				From tables
				Where size>=@amount_people

				if @start_date is null or @end_date is null
				begin;
				throw 52000, 'trzeba podac obie daty',2
				end 

				IF @start_date<GETDATE()
				Begin;
				throw 52000, 'rezerwacja na przeszłość', 3
				end
				
				IF (select * from dbo.getWKClient (@client_id) )< (select top 1 WK from reservationsRequirments order by id desc)
				BEGIN
				;
				THROW 52000, 'Zbyt mało wcześniejszych zamówień', 4
				end

				if @quantity * (select price from AllDishes where dish_name=@dish_name) < (select top 1 WZ from reservationsRequirments order by id desc) 
				begin;
				throw 52000, 'Zbyt niska cena zamówienia', 5
				end 

				Declare @is_seafood bit
				Select @is_seafood=is_seafood from menu as m
				inner join dishes as d on d.id_dish_name=m.dish_name
				Where @dish_name=d.dish_name

				IF @is_seafood=0
				Begin 
				execute addOrder @client_id,0,null,null,@quantity,@dish_name
				End

				IF @is_seafood=1
				Begin 
				execute addSeafoodOrder @client_id,0,null,null,@quantity,@dish_name,@start_date
				End


				INSERT INTO reservationDetails(reservation_id, client_id,table_id)
				VALUES(@ReservationID,@client_id,@table_id);
				INSERT INTO reservations(reservation_id, order_id,start_date,end_date,approved,amount_people)
				VALUES(@ReservationID,@orderID,@start_date,@end_date,@approved,@amount_people);


				END TRY
				BEGIN CATCH
				DECLARE @errorMsg nvarchar(2048)
				=N'Błąd dodania rezerwacji: ' + ERROR_MESSAGE();
				THROW 52000, @errorMsg, 1
				END CATCH
	
END
GO
