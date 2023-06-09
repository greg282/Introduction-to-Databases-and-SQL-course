USE [u_smigala]
GO
/****** Object:  View [dbo].[monthlyInvoice]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[monthlyInvoice]
AS
SELECT        dbo.company.nip, dbo.company.company_name, SUM(dbo.menu.price * dbo.OrderDetails.quantity) AS [total price], MONTH(dbo.orders.order_date) AS month, YEAR(dbo.orders.order_date) AS year, dbo.OrderDetails.quantity, 
                         dbo.dishes.dish_name
FROM            dbo.clients INNER JOIN
                         dbo.company ON dbo.clients.client_id = dbo.company.client_id INNER JOIN
                         dbo.orders ON dbo.clients.client_id = dbo.orders.client_id INNER JOIN
                         dbo.OrderDetails ON dbo.orders.order_id = dbo.OrderDetails.order_id INNER JOIN
                         dbo.menu ON dbo.OrderDetails.id_dish = dbo.menu.id_dish INNER JOIN
                         dbo.dishes ON dbo.menu.dish_name = dbo.dishes.id_dish_name LEFT OUTER JOIN
                         dbo.individualClient ON dbo.clients.client_id = dbo.individualClient.person_id
GROUP BY MONTH(dbo.orders.order_date), YEAR(dbo.orders.order_date), dbo.company.nip, dbo.company.company_name, dbo.OrderDetails.quantity, dbo.dishes.dish_name
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[14] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "clients"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "company"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "orders"
            Begin Extent = 
               Top = 7
               Left = 537
               Bottom = 170
               Right = 731
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 7
               Left = 779
               Bottom = 170
               Right = 973
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "menu"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "individualClient"
            Begin Extent = 
               Top = 175
               Left = 290
               Bottom = 338
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dishes"
            Begin Extent = 
               Top = 174
               Left = 522
               Bottom = 270
               Right = 708
            End
            DisplayFlags ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'monthlyInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1356
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'monthlyInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'monthlyInvoice'
GO
