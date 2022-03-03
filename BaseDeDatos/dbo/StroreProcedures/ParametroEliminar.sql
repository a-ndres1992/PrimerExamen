﻿CREATE PROCEDURE [dbo].[ParametroEliminar]
	@Id_Parametro INT

	AS
Begin
	SET NOCOUNT ON
		BEGIN TRANSACTION TRASA
			BEGIN TRY

				DELETE FROM 
					dbo.Parametro
				WHERE
					@Id_Parametro = @Id_Parametro

				COMMIT TRANSACTION TRASA
				SELECT 0 AS CodeError, '' AS MsgError

			END TRY

			BEGIN CATCH

				SELECT
					ERROR_NUMBER() AS CodeError,
					ERROR_MESSAGE() AS MsgError
				ROLLBACK TRANSACTION TRASA

			END CATCH
END
