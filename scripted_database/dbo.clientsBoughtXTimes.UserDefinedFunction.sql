USE [u_smigala]
GO
/****** Object:  UserDefinedFunction [dbo].[clientsBoughtXTimes]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[clientsBoughtXTimes](@input int)
RETURNS table
AS
	return
	select clients.client_id, individualClient.first_name, individualClient.last_name, company.company_name, COUNT(*) as ilosc from clients inner join orders on orders.client_id = clients.client_id left outer join individualClient on 
	individualClient.person_id=clients.client_id left outer join company on clients.client_id=company.company_id
	group by clients.client_id, individualClient.first_name, individualClient.last_name, company.company_name having @input <= COUNT(*)
GO
