USE [u_smigala]
GO
/****** Object:  StoredProcedure [dbo].[addIndividualClient]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addIndividualClient] @firstname varchar(100),@lastname varchar(100),@phone varchar(12),@email varchar(255),
@city_name varchar(100),@street varchar(255),@postal_code_ varchar(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY

			IF EXISTS(
			SELECT *
			FROM clients
			WHERE @phone=phone
			)
			BEGIN;
			THROW 52000, 'Już jest taki klient', 1
			END
				IF Not EXISTS(
			SELECT *
			FROM cities
			WHERE city_name=@city_name
			)
			BEGIN;
			Declare @id_city INT
			Select	@id_city=ISNULL(MAX(city_id), 0) + 1
			From cities
			INSERT INTO cities(city_id,city_name)
			VALUES (@id_city,@city_name);
			Declare @id_postal_code INT
			Select	@id_postal_code=ISNULL(MAX(postal_code_id), 0) + 1
			From postal_codes
			INSERT INTO postal_codes(postal_code_id,postal_code,city_id)
			VALUES (@id_postal_code,@postal_code_,@id_city);
			END

			DECLARE @city_id INT
			SELECT @city_id = city_id
			FROM cities
			WHERE city_name = @city_name

			DECLARE @postal_code_id INT
			SELECT @postal_code_id = postal_code_id
			FROM postal_codes
			WHERE @postal_code_=postal_code and city_id=@city_id

			DECLARE @person_id INT
			Select	@person_id=ISNULL(MAX(client_id), 0) + 1
			FROM clients

			DECLARE @client_id INT
			Select	@client_id=ISNULL(MAX(client_id), 0) + 1
			FROM individualClient

			INSERT INTO discounts(client_id,R2startdate,R2_used,R1startdate)
			VALUES (@client_id,NULL,NULL,NULL);

			INSERT INTO clients(client_id,phone,email,city,street,postal_code)
			VALUES (@person_id,@phone,@email,@city_id,@street,@postal_code_id);

			INSERT INTO individualClient(client_id,person_id,first_name,last_name)
			VALUES (@client_id,@person_id,@firstname,@lastname);

		

			END TRY
			BEGIN CATCH
			DECLARE @msg nvarchar(2048)
			=N'Error:' + ERROR_MESSAGE();
			THROW 52000, @msg, 1
			END CATCH
END
GO
