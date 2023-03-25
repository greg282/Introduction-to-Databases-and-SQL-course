USE [u_smigala]
GO
/****** Object:  View [dbo].[OrdersInfo]    Script Date: 25.03.2023 23:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrdersInfo]
AS
SELECT        TOP (100) PERCENT dbo.orders.order_id, dbo.orders.client_id, (SUM(dbo.menu.price * dbo.OrderDetails.quantity) * (100 - ISNULL(dbo.ClientDiscountInfoR1.R1, 0)) / 100) * (100 - ISNULL(dbo.ClientDiscountInfo.R2, 0)) 
                         / 100 AS TotalPrice, dbo.ClientDiscountInfoR1.R1, dbo.ClientDiscountInfo.R2
FROM            dbo.orders INNER JOIN
                         dbo.OrderDetails ON dbo.orders.order_id = dbo.OrderDetails.order_id INNER JOIN
                         dbo.menu ON dbo.OrderDetails.id_dish = dbo.menu.id_dish INNER JOIN
                         dbo.clients ON dbo.orders.client_id = dbo.clients.client_id LEFT OUTER JOIN
                         dbo.ClientDiscountInfo ON dbo.clients.client_id = dbo.ClientDiscountInfo.client_id LEFT OUTER JOIN
                         dbo.ClientDiscountInfoR1 ON dbo.clients.client_id = dbo.ClientDiscountInfoR1.client_id
GROUP BY dbo.orders.order_id, dbo.orders.client_id, dbo.ClientDiscountInfoR1.R1, dbo.ClientDiscountInfo.R2
ORDER BY dbo.orders.order_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[24] 2[20] 3) )"
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
         Begin Table = "orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 13
               Left = 403
               Bottom = 143
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "menu"
            Begin Extent = 
               Top = 6
               Left = 611
               Bottom = 136
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clients"
            Begin Extent = 
               Top = 173
               Left = 113
               Bottom = 336
               Right = 323
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ClientDiscountInfo"
            Begin Extent = 
               Top = 7
               Left = 829
               Bottom = 170
               Right = 1039
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ClientDiscountInfoR1"
            Begin Extent = 
               Top = 185
               Left = 570
               Bottom = 335
               Right = 780
            End
            DisplayFlags = 280
            TopColumn = 2
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
         Width = 1500
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrdersInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrdersInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrdersInfo'
GO
