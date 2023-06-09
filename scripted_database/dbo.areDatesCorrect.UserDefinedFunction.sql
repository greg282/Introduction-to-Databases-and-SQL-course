USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[areDatesCorrect]    Script Date: 25.03.2023 23:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[areDatesCorrect](@input1 date, @input2 date)
RETURNS bit
AS
	begin 
		DECLARE @val bit;
		IF DATEDIFF(day, @input1, @input2) < 15
			begin
				SET @val = 1
			end
		IF DATEDIFF(day, @input1, @input2) >= 15
			begin
				SET @val = 0
			end
		return @val
	end
GO
