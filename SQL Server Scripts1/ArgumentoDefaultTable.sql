SET  ANSI_NULLS ON

GO

SET  QUOTED_IDENTIFIER ON

GO

CREATE TABLE [DBO].[Pais](
[idpais][char](3) NOT NULL,
[Pais][varchar](30) NULL,

CONTRAINT [PK_Pais] PRIMARY KEY CLUSTERED
(
[idPais]ASC
)
WITH(PAD_INDEX = OFF,STATISTICS_NORECOMPUTE = OFF,
IGNORE_DUP_KEY = OFF,ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON[PRIMARY]

GO