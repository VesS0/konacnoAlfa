USE [student-advisor]
GO
/****** Object:  Table [dbo].[Banovanje]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banovanje](
	[idClan] [int] NOT NULL,
	[datumKraja] [date] NULL,
	[razlog] [varchar](1024) NULL,
 CONSTRAINT [PK_Banovanje] PRIMARY KEY CLUSTERED 
(
	[idClan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clan]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clan](
	[idClan] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](20) NOT NULL,
	[prezime] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[datumRodjenja] [date] NULL,
	[pol] [char](1) NULL,
	[godinaUpisa] [int] NULL,
	[tip] [char](1) NULL,
	[opis] [varchar](1024) NULL,
	[prosecnaOcena] [float] NULL,
	[brNeprocPoruka] [int] NULL,
 CONSTRAINT [PK_Clan] PRIMARY KEY CLUSTERED 
(
	[idClan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Komentar]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Komentar](
	[idKom] [int] IDENTITY(1,1) NOT NULL,
	[idClan] [int] NOT NULL,
	[idKurs] [int] NOT NULL,
	[tekst] [varchar](1024) NULL,
	[datum] [date] NULL,
	[brPodrzavanja] [int] NULL,
	[brNepodrzavanja] [int] NULL,
 CONSTRAINT [PK_Komentar] PRIMARY KEY CLUSTERED 
(
	[idKom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kurs]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kurs](
	[idKurs] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](20) NOT NULL,
	[opis] [varchar](1024) NULL,
	[prosecnaOcena] [float] NULL,
	[zanimljivost] [int] NULL,
	[korisnost] [int] NULL,
	[tezina] [int] NULL,
	[preporuka] [int] NULL,
 CONSTRAINT [PK_Kurs] PRIMARY KEY CLUSTERED 
(
	[idKurs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Podkomentar]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Podkomentar](
	[idKom] [int] NOT NULL,
	[redniBroj] [int] NOT NULL,
	[idClan] [int] NULL,
	[tekst] [varchar](1024) NULL,
	[datum] [date] NULL,
 CONSTRAINT [PK_Podkomentar] PRIMARY KEY CLUSTERED 
(
	[idKom] ASC,
	[redniBroj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Podrzavanje]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Podrzavanje](
	[idClan] [int] NOT NULL,
	[idKom] [int] NOT NULL,
	[tip] [char](1) NULL,
 CONSTRAINT [PK_Podrzavanje] PRIMARY KEY CLUSTERED 
(
	[idClan] ASC,
	[idKom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Polozio]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Polozio](
	[idClan] [int] NOT NULL,
	[idKurs] [int] NOT NULL,
	[ocena] [varchar](20) NULL,
	[datum] [date] NULL,
	[zanimljivost] [int] NULL,
	[korisnost] [int] NULL,
	[tezina] [int] NULL,
	[preporuka] [int] NULL,
 CONSTRAINT [PK_Polozio] PRIMARY KEY CLUSTERED 
(
	[idClan] ASC,
	[idKurs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Poruka]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Poruka](
	[idClan1] [int] NOT NULL,
	[idClan2] [int] NOT NULL,
	[datum] [date] NULL,
	[tekst] [varchar](1024) NULL,
	[procitana] [tinyint] NULL,
 CONSTRAINT [PK_Poruka] PRIMARY KEY CLUSTERED 
(
	[idClan1] ASC,
	[idClan2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Predaje]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predaje](
	[idKurs] [int] NOT NULL,
	[idPred] [int] NOT NULL,
	[datumPoc] [date] NULL,
 CONSTRAINT [PK_Predaje] PRIMARY KEY CLUSTERED 
(
	[idKurs] ASC,
	[idPred] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Predavac]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Predavac](
	[idPred] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](20) NOT NULL,
	[prezime] [varchar](20) NOT NULL,
	[email] [varchar](50) NULL,
	[katedra] [varchar](50) NULL,
	[godinaZaposlenja] [int] NULL,
	[opis] [varchar](1024) NULL,
 CONSTRAINT [PK_Predavac] PRIMARY KEY CLUSTERED 
(
	[idPred] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unapredjivanje]    Script Date: 5/22/2016 2:34:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unapredjivanje](
	[idClan] [int] NOT NULL,
	[tip] [char](1) NOT NULL,
	[opis] [varchar](1024) NULL,
	[trebaSaglasnost] [char](1) NOT NULL,
 CONSTRAINT [PK_Unapredjivanje] PRIMARY KEY CLUSTERED 
(
	[idClan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Banovanje]  WITH CHECK ADD  CONSTRAINT [FK_Banovanje_Clan] FOREIGN KEY([idClan])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Banovanje] CHECK CONSTRAINT [FK_Banovanje_Clan]
GO
ALTER TABLE [dbo].[Komentar]  WITH CHECK ADD  CONSTRAINT [FK_Komentar_Clan] FOREIGN KEY([idClan])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Komentar] CHECK CONSTRAINT [FK_Komentar_Clan]
GO
ALTER TABLE [dbo].[Komentar]  WITH CHECK ADD  CONSTRAINT [FK_Komentar_Kurs] FOREIGN KEY([idKurs])
REFERENCES [dbo].[Kurs] ([idKurs])
GO
ALTER TABLE [dbo].[Komentar] CHECK CONSTRAINT [FK_Komentar_Kurs]
GO
ALTER TABLE [dbo].[Podkomentar]  WITH CHECK ADD  CONSTRAINT [FK_Podkomentar_Clan] FOREIGN KEY([idClan])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Podkomentar] CHECK CONSTRAINT [FK_Podkomentar_Clan]
GO
ALTER TABLE [dbo].[Podkomentar]  WITH CHECK ADD  CONSTRAINT [FK_Podkomentar_Komentar] FOREIGN KEY([idKom])
REFERENCES [dbo].[Komentar] ([idKom])
GO
ALTER TABLE [dbo].[Podkomentar] CHECK CONSTRAINT [FK_Podkomentar_Komentar]
GO
ALTER TABLE [dbo].[Podrzavanje]  WITH CHECK ADD  CONSTRAINT [FK_Podrzavanje_Clan] FOREIGN KEY([idClan])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Podrzavanje] CHECK CONSTRAINT [FK_Podrzavanje_Clan]
GO
ALTER TABLE [dbo].[Podrzavanje]  WITH CHECK ADD  CONSTRAINT [FK_Podrzavanje_Komentar] FOREIGN KEY([idKom])
REFERENCES [dbo].[Komentar] ([idKom])
GO
ALTER TABLE [dbo].[Podrzavanje] CHECK CONSTRAINT [FK_Podrzavanje_Komentar]
GO
ALTER TABLE [dbo].[Polozio]  WITH CHECK ADD  CONSTRAINT [FK_Polozio_Clan] FOREIGN KEY([idClan])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Polozio] CHECK CONSTRAINT [FK_Polozio_Clan]
GO
ALTER TABLE [dbo].[Polozio]  WITH CHECK ADD  CONSTRAINT [FK_Polozio_Kurs] FOREIGN KEY([idKurs])
REFERENCES [dbo].[Kurs] ([idKurs])
GO
ALTER TABLE [dbo].[Polozio] CHECK CONSTRAINT [FK_Polozio_Kurs]
GO
ALTER TABLE [dbo].[Poruka]  WITH CHECK ADD  CONSTRAINT [FK_Poruka_Clan] FOREIGN KEY([idClan1])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Poruka] CHECK CONSTRAINT [FK_Poruka_Clan]
GO
ALTER TABLE [dbo].[Poruka]  WITH CHECK ADD  CONSTRAINT [FK_Poruka_Clan1] FOREIGN KEY([idClan2])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Poruka] CHECK CONSTRAINT [FK_Poruka_Clan1]
GO
ALTER TABLE [dbo].[Predaje]  WITH CHECK ADD  CONSTRAINT [FK_Predaje_Kurs] FOREIGN KEY([idKurs])
REFERENCES [dbo].[Kurs] ([idKurs])
GO
ALTER TABLE [dbo].[Predaje] CHECK CONSTRAINT [FK_Predaje_Kurs]
GO
ALTER TABLE [dbo].[Predaje]  WITH CHECK ADD  CONSTRAINT [FK_Predaje_Predavac] FOREIGN KEY([idPred])
REFERENCES [dbo].[Predavac] ([idPred])
GO
ALTER TABLE [dbo].[Predaje] CHECK CONSTRAINT [FK_Predaje_Predavac]
GO
ALTER TABLE [dbo].[Unapredjivanje]  WITH CHECK ADD  CONSTRAINT [FK_Unapredjivanje_Clan] FOREIGN KEY([idClan])
REFERENCES [dbo].[Clan] ([idClan])
GO
ALTER TABLE [dbo].[Unapredjivanje] CHECK CONSTRAINT [FK_Unapredjivanje_Clan]
GO
ALTER TABLE [dbo].[Clan]  WITH CHECK ADD  CONSTRAINT [CK_Clan] CHECK  (([tip]='c' OR [tip]='m' OR [tip]='a'))
GO
ALTER TABLE [dbo].[Clan] CHECK CONSTRAINT [CK_Clan]
GO
ALTER TABLE [dbo].[Podrzavanje]  WITH CHECK ADD  CONSTRAINT [CK_Podrzavanje_TIP] CHECK  (([tip]='d' OR [tip]='n'))
GO
ALTER TABLE [dbo].[Podrzavanje] CHECK CONSTRAINT [CK_Podrzavanje_TIP]
GO
ALTER TABLE [dbo].[Unapredjivanje]  WITH CHECK ADD  CONSTRAINT [CK_Unapredjivanje_Saglasnost] CHECK  (([trebaSaglasnost]='d' OR [trebaSaglasnost]='n'))
GO
ALTER TABLE [dbo].[Unapredjivanje] CHECK CONSTRAINT [CK_Unapredjivanje_Saglasnost]
GO
ALTER TABLE [dbo].[Unapredjivanje]  WITH CHECK ADD  CONSTRAINT [CK_Unapredjivanje_TIP] CHECK  (([tip]='u' OR [tip]='d'))
GO
ALTER TABLE [dbo].[Unapredjivanje] CHECK CONSTRAINT [CK_Unapredjivanje_TIP]
GO
