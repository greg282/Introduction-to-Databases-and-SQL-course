USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[SetAsActiveInMenu]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetAsActiveInMenu] @List VARCHAR(MAX), @Delimiter  CHAR(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	Begin Try
		

		Update menu
		Set in_menu=1
		from menu inner JOin SplitInts(@List,@Delimiter) as t1 on t1.Item=menu.id_dish 
		END TRY
		BEGIN CATCH
		DECLARE @msg nvarchar(2048)
		=N'Error:' + ERROR_MESSAGE();
		THROW 52000, @msg, 1
		END CATCH

END
GO
