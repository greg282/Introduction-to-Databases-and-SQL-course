USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[ApproveReservation]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ApproveReservation] 

-- Add the parameters for the stored procedure here
	@Approve int,
	@ReservationId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
			BEGIN TRY
		IF NOT EXISTS(
		SELECT * FROM reservations
		WHERE reservation_id = @ReservationId)
		BEGIN;
		THROW 52000, 'Nie ma takiej rezerwacji',1
		END

		UPDATE reservations
		SET approved = @Approve
		WHERE reservation_id = @ReservationId;
		END TRY

		BEGIN CATCH
		DECLARE @msg nvarchar(2048)
		=N'Error:' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH

	
END
GO
