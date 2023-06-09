USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[addDish]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addDish] @dish_name nchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	BEGIN TRY
		IF EXISTS(
		SELECT *
		FROM dishes
		WHERE dish_name = @dish_name
		)
		BEGIN
		;
		THROW 52000, 'Danie jest już w tabeli', 1
		END

		DECLARE @id_dish_name INT
		SELECT @id_dish_name = ISNULL(MAX(id_dish_name), 0) + 1
		FROM dishes
		INSERT INTO dishes(id_dish_name,dish_name)
		VALUES (@id_dish_name,@dish_name);
		END TRY
		BEGIN CATCH
		DECLARE @msg nvarchar(2048)
		='Error: ' + ERROR_MESSAGE();
		THROW 52000, @msg, 1;
		END CATCH
END
GO
